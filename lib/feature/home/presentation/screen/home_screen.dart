import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_serviece/core/unified_api/status.dart';
import 'package:home_serviece/feature/estate/presentation/screen/all_estates_screen.dart';
import 'package:home_serviece/feature/estate/presentation/screen/fav_screen.dart';
import 'package:home_serviece/feature/home/bloc/bloc/home_bloc.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:home_serviece/feature/estate/presentation/screen/details_estate.dart';
import 'package:home_serviece/feature/estate/presentation/widget/estate_card.dart';
import 'package:home_serviece/feature/home/presentation/screen/notification_screen.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';
import 'package:home_serviece/feature/home/presentation/widget/home_slider.dart';
import 'package:home_serviece/feature/home/presentation/widget/providers_section.dart';
import 'package:home_serviece/feature/service/presentation/screen/provider_screen.dart';
import 'package:home_serviece/feature/service/presentation/screen/services_provider.dart';
import 'package:home_serviece/feature/service/presentation/widget/services_data.dart';

import '../../../service/presentation/screen/services_screen.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'homepage';

  const HomeScreen({
    Key? key,
  }) : super(key: key);
  

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool viewHouse = false;
  int selectedTabIndex = 0;
  final tabs = ['Houses', 'Services', 'Providers'];
@override
void initState(){
  super.initState();
   print("🔁 Sending GetTrendingEvent from initState");
  Future.microtask((){
  context.read<HomeBloc>().add(GetTrendingEvent());
});

 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 35,
              ),
              Container(
                height: 70,
                child: Padding(
                  padding: EdgeInsets.only(top: 6, left: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/splash2.png',
                        width: 70,
                      ),
                      const Text(
                        'Dream House',
                        style: TextStyle(
                            fontFamily: 'Pacifico',
                            fontSize: 24,
                            color: color1,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FavoritesScreen(
                                          favoriteEstates: [],
                                        )));
                          },
                          child: Icon(
                            Icons.favorite_border,
                            color: color1,
                            size: 25,
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        NotificationsScreen()));
                          },
                          child: Icon(
                            Icons.notifications_active_rounded,
                            color: color1,
                            size: 25,
                          )),
                    ],
                  ),
                ),
              ),
              HomeSlider(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: SizedBox(
                  height: 50,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: tabs.length,
                    separatorBuilder: (_, __) => SizedBox(width: 10),
                    itemBuilder: (context, index) {
                      final isSelected = selectedTabIndex == index;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTabIndex = index;
                          });

                          if (tabs[index] == 'Houses') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AllEstatesScreen(),
                                ));
                          } else if (tabs[index] == 'Providers') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProvidersScreen(),
                                ));
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ServicesScreen()));
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 10),
                          decoration: BoxDecoration(
                            color: isSelected ? color1 : color2,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Text(
                            tabs[index],
                            style: TextStyle(
                              color: isSelected ? color6 : color5,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Trinding Houses',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: color1,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                     
                       BlocBuilder<HomeBloc, HomeState>(
                        
  builder: (context, state) {
    print('🔍 BlocBuilder: trendingHousesStatus = ${state.trendingHousesStatus}');
    print('📦 عدد العقارات في trendingHouses = ${state.trendingHouses.length}');

    switch (state.trendingHousesStatus) {
      case ApiStatus.loading:
        return const Center(child: CircularProgressIndicator());

      case ApiStatus.failed:
        return Center(
          child: ElevatedButton(
            onPressed: () {
              context.read<HomeBloc>().add(GetTrendingEvent());
            },
            child: const Text('Try Again'),
          ),
        );

      case ApiStatus.success:
        final trending_houses = state.trendingHouses;

        if (trending_houses.isEmpty) {
          return const Center(child: Text('لا يوجد عقارات حالياً'));
        }

        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.33,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: trending_houses.length,
            itemBuilder: (context, index) {
              final house = trending_houses[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsEstate(estate: house),
                    ),
                  );
                },
                child: EstateCard(estate: house),
              );
            },
          ),
        );

      case ApiStatus.initial:
      default:
        return const SizedBox();
    }
  },
),


                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'popular service',
                                style: TextStyle(
                                    fontSize: 24,
                                    color: color1,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 120,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: services.length,
                            itemBuilder: (context, index) {
                              final service = services[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ServiceProvidersScreen(
                                              service: service),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 100,
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    color: color7,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        service['image'],
                                        width: 60,
                                        height: 60,
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        service['name'],
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Famouse Provider',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: color1,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        ProvidersSection(),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
