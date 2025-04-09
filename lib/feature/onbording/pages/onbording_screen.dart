import 'package:flutter/material.dart';
import 'package:home_serviece/feature/auth/presentation/screen/login_screen.dart';
import 'package:home_serviece/feature/auth/presentation/widget/button.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  ValueNotifier index1 = ValueNotifier(0);
  List<OnboardingData> data = [
    OnboardingData(
      image: 'assets/images/02_Onbording 2.png',
      title: 'Buy Your Dream Home',
    ),
    OnboardingData(
      image: 'assets/images/03_Orbording 3.png',
      title: 'Sale Your property',
    ),
    OnboardingData(
      image: 'assets/images/onbor_3.jpg',
      title: 'Sale Your property',
    ),
    OnboardingData(
      image: 'assets/images/onbording_4.jpg',
      title: 'Find best place to stay in good price',
    )
  ];
  PageController pageController =
      PageController(initialPage: 0, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color4,
      body: PageView.builder(
        controller: pageController,
        itemCount: data.length,
        onPageChanged: (page) {
          index1.value = page;
        },
        itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  (Image.asset(
                    data[index].image,
                    height: 400,
                    width: 400,
                  )),
                  Text(
                    data[index].title,
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: color3,
                        fontFamily: 'Satisfy'),
                  ),
                  index == data.length - 1
                      ? Button(
                          ontap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ));
                          },
                          name: 'Get Start')
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                              Button(
                                  ontap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                        ));
                                  },
                                  name: 'Skip'),
                              Button(
                                  ontap: () {
                                    pageController.nextPage(
                                        duration: const Duration(seconds: 1),
                                        curve: Curves.ease);
                                  },
                                  name: 'Next')
                            ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomContainer(
                        isselected: index == 0,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      CustomContainer(
                        isselected: index == 1,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      CustomContainer(
                        isselected: index == 2,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      CustomContainer(
                        isselected: index == 3,
                      ),
                    ],
                  ),
                ])),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.isselected});
  final bool isselected;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: isselected ? 20 : 12,
        height: 8,
        decoration: BoxDecoration(
            color: isselected ? color1 : color2,
            borderRadius: BorderRadius.circular(15)));
  }
}

class OnboardingData {
  final String image;
  final String title;

  OnboardingData({
    required this.image,
    required this.title,
  });
}
