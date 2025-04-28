import 'package:home_serviece/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:home_serviece/feature/estate/presentation/screen/details_estate.dart';
import 'package:home_serviece/feature/estate/presentation/widget/estate_card.dart';
import 'package:home_serviece/feature/estate/presentation/widget/estate_data.dart';
import 'package:home_serviece/feature/home/presentation/screen/notification_screen.dart';
import 'package:home_serviece/feature/home/presentation/screen/services_screen.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';
import 'package:home_serviece/feature/home/presentation/widget/home_slider.dart';
import 'package:home_serviece/feature/home/presentation/widget/providers_section.dart';
import 'package:home_serviece/feature/service/presentation/screen/provider_screen.dart';
import 'package:home_serviece/feature/service/presentation/screen/services_provider.dart';
import 'package:home_serviece/feature/service/presentation/widget/services_data.dart';

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
                        width: 110,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        NotificationsScreen()));
                          },
                          child: Image.asset('assets/images/Notification.png')),
                    ],
                  ),
                ),
              ),
              HomeSlider(estates: estates),
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
                            TextButton(
                                onPressed: () {
                                  viewHouse = true;
                                  setState(() {});
                                },
                                child: const Text(
                                  'view all',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: color3,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                        viewHouse
                            ? Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      viewHouse = false;
                                      setState(() {});
                                    },
                                    icon: const Icon(Icons.arrow_upward),
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    height:
                                        500, // عدلت الارتفاع من 900 لـ 500 ليكون أكثر واقعية
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: estates.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {},
                                          child: EstateCard(
                                              estate: estates[index]),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              )
                            : SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.33,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: estates.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailsEstate(
                                                      estate: estates[index]),
                                            ));
                                      },
                                      child: EstateCard(estate: estates[index]),
                                    );
                                  },
                                ),
                              ),
                        //

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
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ServicesScreen()));
                                  },
                                  child: const Text(
                                    'View all',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: color3,
                                        fontWeight: FontWeight.bold),
                                  )),
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
                                    color: Colors.blue.shade100,
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
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProvidersScreen(),
                                      ));
                                },
                                child: const Text(
                                  'View all',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: color3,
                                      fontWeight: FontWeight.bold),
                                )),
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
