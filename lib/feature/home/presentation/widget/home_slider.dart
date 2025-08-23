// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_serviece/core/helper/image_helper.dart';
import 'package:home_serviece/feature/estate/presentation/screen/estate_details_screen.dart';
import '../../../../core/unified_api/status.dart';
import '../../bloc/bloc/home_bloc.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({Key? key}) : super(key: key);

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  final PageController _controller = PageController(viewportFraction: 0.8);
  int _currentIndex = 0;
  Timer? _timer;

  void _startAutoSlide(int length) {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      try {
        if (_controller.hasClients && length > 1) {
          setState(() {
            _currentIndex = (_currentIndex + 1) % length;
            _controller.animateToPage(
              _currentIndex,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          });
        }
      } catch (e) {
        print('Error in timer: $e');
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final status = state.trendingHousesStatus;
        switch (status) {
          case ApiStatus.loading:
            return const Center(child: CircularProgressIndicator());

          case ApiStatus.failed:
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<HomeBloc>().add(GetTrendingEvent());
                },
                child: const Text("Try Again"),
              ),
            );

          case ApiStatus.success:
            final sliderEstates = state.trendingHouses;
            if (sliderEstates.isEmpty) {
              return const Center(child: Text("لا يوجد عقارات حالياً"));
            }

            _timer?.cancel();
            _startAutoSlide(sliderEstates.length);

            return SizedBox(
              height: 220,
              width: double.infinity,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _controller,
                    itemCount: sliderEstates.length,
                    itemBuilder: (context, index) {
                      final sliderEstate = sliderEstates[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EstateDetailsScreen(
                                estateId: sliderEstate.id!,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Stack(
                              children: [
                                MyImageWidget(
                                  imagePath: sliderEstate.images![0],
                                ),
                                Positioned(
                                  bottom: 10,
                                  left: 10,
                                  child: Container(
                                    padding: const EdgeInsets.all(6),
                                    color: Colors.black54,
                                    child: Text(
                                      sliderEstate.title ?? '',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 15,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        state.trendingHouses.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: _currentIndex == index ? 12 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentIndex == index
                                ? Colors.white
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );

          case ApiStatus.initial:
            return const SizedBox();
        }
      },
    );
  }
}
