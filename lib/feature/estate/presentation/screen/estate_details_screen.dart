// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_serviece/core/helper/image_helper.dart';
import 'package:home_serviece/feature/estate/data/data_source/estate_datasource.dart';
import 'package:home_serviece/feature/estate/presentation/widget/estate_data.dart';

import '../../../../core/unified_api/status.dart';
import '../../../home/presentation/widget/const.dart';
import '../../../order/presentation/screen/request_house_screen.dart';
import '../../bloc/bloc/estate_bloc.dart';
import '../../data/models/get_estate_detailes.dart';
import 'estate_details_galary.dart';

class EstateDetailsScreen extends StatefulWidget {
  final int estateId;
  const EstateDetailsScreen({
    Key? key,
    required this.estateId,
  }) : super(key: key);

  @override
  State<EstateDetailsScreen> createState() => _EstateDetailsScreenState();
}

class _EstateDetailsScreenState extends State<EstateDetailsScreen> {
  bool isFav = false;

  @override
  void initState() {
    super.initState();
    print("🔁 Sending GetTrendingEvent from initState");
    context.read<EstateBloc>().add(GetEstateDetailsEvent(widget.estateId));
    print('ID from card: ${widget.estateId}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color6,
      body: BlocBuilder<EstateBloc, EstateState>(
        builder: (context, state) {
          switch (state.detailsEstateStatus) {
            case ApiStatus.initial:
              return Center(child: CircularProgressIndicator());

            case ApiStatus.loading:
              return Center(child: CircularProgressIndicator());

            case ApiStatus.success:
              final estate = state.estatedetails;

              return SafeArea(
                child: Column(
                  children: [
                    // صورة العقار الأساسية
                    Stack(
                      children: [
                       
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                          child: estate?.images != null && estate!.images!.isNotEmpty
                              ?
                              MyImageWidget(imagePath: estate.images!.first)
                              //  Image.network(
                              //     estate.images!.first,
                              //     height: MediaQuery.of(context).size.height * 0.6,
                              //     width: double.infinity,
                              //     fit: BoxFit.cover,
                              //     errorBuilder: (context, error, stackTrace) {
                              //       return Container(
                              //         height: MediaQuery.of(context).size.height * 0.6,
                              //         width: double.infinity,
                              //         color: color4,
                              //         alignment: Alignment.center,
                              //         child: Icon(
                              //           Icons.error_outline,
                              //           color: Colors.redAccent,
                              //           size: 60,
                              //         ),
                              //       );
                              //     },
                              //   )
                              : Container(
                                  height: MediaQuery.of(context).size.height * 0.4,
                                  width: double.infinity,
                                  color: color4,
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.error_outline,
                                    color: Colors.redAccent,
                                    size: 60,
                                  ),
                                ),
                        ),
                        Positioned(
                          top: 16,
                          left: 16,
                          child: _circleButton(
                            icon: Icons.arrow_back,
                            onTap: () => Navigator.pop(context),
                          ),
                        ),
                        Positioned(
                          top: 16,
                          right: 16,
                          child: _circleButton(
                            icon: isFav ? Icons.favorite : Icons.favorite_border,
                            color: isFav ? Colors.red : color7,
                            onTap: () {
                              setState(() {
                                isFav = !isFav;
                              });
                            },
                          ),
                        ),
                      ],
                    ),

                    // باقي المعلومات والتفاصيل + معرض الصور
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              estate?.title ?? "بدون عنوان",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: color1,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              estate?.description ?? "لا يوجد وصف",
                              style: TextStyle(
                                color: color3,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Icon(Icons.location_on, color: color3),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    estate?.address != null
                                        ? '${estate?.address!.city ?? ""}, ${estate?.address!.region ?? ""}, ${estate?.address!.street ?? ""}'
                                        : "لا يوجد عنوان",
                                    style: TextStyle(color: color3),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),

                            // السعر والحالة والفترة
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  estate?.price ?? "-",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: color2,
                                  ),
                                ),
                                Text(
                                  estate?.status ?? "-",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: color3,
                                  ),
                                ),
                                if (estate?.period != null)
                                  Text(
                                    estate!.period!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: color3,
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 24),

                            // معرض الصور كشبكة
                           
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Gallery',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: color1,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                               
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );

            case ApiStatus.failed:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.message ?? 'حدث خطأ أثناء تحميل البيانات.',
                      style: TextStyle(color: Colors.red, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {
                        context.read<EstateBloc>().add(GetEstateDetailsEvent(widget.estateId));
                      },
                      child: Text('حاول مرة أخرى'),
                    ),
                    const SizedBox(height: 12),

                      SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: color7,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateHouseOrderContent(
                                    houseId: 1,

                                    )),
                          );
                        },
                        child: Text(
                          'Buy Now',
                          style: TextStyle(color: color5, fontSize: 16),
                        ),
                      )
                      ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }

  Widget _circleButton({
    required IconData icon,
    required VoidCallback onTap,
    Color? color,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color ?? color6,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 20, color: color5),
      ),
    );
  }
}
