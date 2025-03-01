// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter/material.dart';

import 'package:home_serviece/feature/home/presentation/screen/services_screen.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';

import '../widget/package_home.dart';
import '../widget/package_porovider.dart';
import '../widget/package_service.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'homepage';
  final DetService ? detService;
  
  
  const HomeScreen({
    Key? key,
     this.detService,
    
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pageController = PageController(
    initialPage: 0,
    viewportFraction: .8,
  );

  // @override
  // void initState(){
  //   Timer.periodic(Duration.extralong4 * 5 , (timer){
  //     pageController.animateToPage(pageController.page!.toInt() +1,
  //      duration: Duration.long1, curve: Curves.easeIn);
  //    });
  //    super.initState();
  // }
  
  List<ImageHome> listImage = [
    ImageHome(
      image: 'assets/images/image 51.png'),
    ImageHome(
      image: 'assets/images/ Gallery - Small-2.png'),
    ImageHome(
      image: 'assets/images/ Gallery - Small-1.png'),
    ImageHome(
      image: 'assets/images/image 51.png'),
    ImageHome(
      image: 'assets/images/image 51.png'),
      
      

  ];  
  List<Package> listHomes = [
    Package(
        type: 'Villa',
        name: 'Bunding',
        rating: '4.2',
        price: '250',
        photo: 'assets/images/ Gallery - Small-3.png',
        location: 'Aleppo_alhamdania'),
    Package(
        type: 'Villa',
        name: 'Bunding',
        rating: '4.2',
        price: '250',
        photo: 'assets/images/ Gallery - Small-3.png',
        location: 'Aleppo_alhamdania'),
    Package(
        type: 'Villa',
        name: 'Bunding',
        rating: '4.2',
        price: '250',
        photo: 'assets/images/ Gallery - Small-3.png',
        location: 'Aleppo_alhamdania'),
    Package(
        type: 'Villa',
        name: 'Bunding',
        rating: '4.2',
        price: '250',
        photo: 'assets/images/ Gallery - Small-3.png',
        location: 'Aleppo_alhamdania'),
    Package(
        type: 'Villa',
        name: 'Bunding',
        rating: '4.2',
        price: '250',
        photo: 'assets/images/ Gallery - Small-3.png',
        location: 'Aleppo_alhamdania'),
    Package(
        type: 'Villa',
        name: 'Bunding',
        rating: '4.2',
        price: '250',
        photo: 'assets/images/ Gallery - Small-3.png',
        location: 'Aleppo_alhamdania'),
    Package(
        type: 'Villa',
        name: 'Bunding',
        rating: '4.2',
        price: '250',
        photo: 'assets/images/ Gallery - Small-3.png',
        location: 'Aleppo_alhamdania'),
  ];
  List<DetService> listPservice =[
     DetService(
    imageSer: 'assets/images/Laundry.png', 
    titleSer: 'Laudry'),
    DetService(
    imageSer: 'assets/images/image 117.png', 
    titleSer: 'Electric'),
    DetService(
    imageSer: 'assets/images/image 118.png', 
    titleSer: 'solar'),
    DetService(
    imageSer: 'assets/images/image 118.png', 
    titleSer: 'plumber'),
    DetService(
    imageSer: 'assets/images/image 118.png', 
    titleSer: 'Painting'),
     DetService(
    imageSer: 'assets/images/image 118.png', 
    titleSer: 'Air condition'),
     DetService(
    imageSer: 'assets/images/image 118.png', 
    titleSer: 'repair'),
     DetService(
    imageSer: 'assets/images/image 118.png', 
    titleSer: 'plumber'),
     DetService(
    imageSer: 'assets/images/image 118.png', 
    titleSer: 'plumber'),
    
    
  

  
];
   
 
  List<PackagePro> listProvider = [

    PackagePro(
        type: 'solar',
        name: 'Ahmed Mustafa',
        rating: '3.7',
        price: '20',
        photo: 'assets/images/image 83.png',
        location: 'Aleppo_alshahba',
        phone: 0931267548,
        experiance: 3, bio: '',
         Gallery: []),
     PackagePro(
        type: 'solar',
        name: 'Ahmed Mustafa',
        rating: '3.7',
        price: '20',
        photo: 'assets/images/image 83-1.png',
        location: 'Aleppo_alshahba',
        phone: 0931267548,
        experiance: 3, bio: '',
         Gallery: []),
       PackagePro(
        type: 'solar',
        name: 'Ahmed Mustafa',
        rating: '3.7',
        price: '20',
        photo: 'assets/images/image 83.png',
        location: 'Aleppo_alshahba',
        phone: 0931267548,
        experiance: 3, bio: '',
         Gallery: []),
       PackagePro(
        type: 'solar',
        name: 'Ahmed Mustafa',
        rating: '3.7',
        price: '20',
        photo: 'assets/images/image 83.png',
        location: 'Aleppo_alshahba',
        phone: 0931267548,
        experiance: 3, bio: '',
         Gallery: []),
       PackagePro(
        type: 'solar',
        name: 'Ahmed Mustafa',
        rating: '3.7',
        price: '20',
        photo: 'assets/images/image 83.png',
        location: 'Aleppo_alshahba',
        phone: 0931267548,
        experiance: 3, bio: '',
         Gallery: []),
   
  ];
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
                          onPressed: () {},
                          child:
                              Image.asset('assets/images/ Notification.png')),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        itemCount: listImage.length,
                        padEnds: true,
                        controller: pageController,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Image.asset(
                                  listImage[index].image,
                                  fit: BoxFit.fill,
                                  width: MediaQuery.sizeOf(context).width * .8,
                                ),
                                const Positioned(
                                    bottom: 40,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Black'),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
                              ' Trinding Houses',
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
                                  'View all',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: color3,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                        viewHouse
                            ? SingleChildScrollView(
                                child: Column(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          viewHouse = false;
                                          setState(() {});
                                        },
                                        icon: const Icon(Icons.arrow_upward)),
                                    SizedBox(
                                      
                                      child: ListView.builder(

                                        itemCount: listHomes.length,
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) =>
                                            PackageHomes(
                                                package: listHomes[index]),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox(
                                height: 300,
                                child: ListView.builder(
                                  itemCount: listHomes.length,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) =>
                                      PackageHomes(package: listHomes[index]),
                                ),
                              ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'popular Service',
                                style: TextStyle(
                                    fontSize: 24,
                                    color: color1,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context, 
                                      MaterialPageRoute(builder: (context) =>
                                       ServicesScreen(
                                        
                                       )
                                       )
                                    );
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
                            width: double.infinity,
                            height: 130,
                            
                                
                                  child: ListView.builder(
                                    itemCount: listPservice.length,
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) =>
                                        PackageService(
                                          detService: listPservice[index])
                                   
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
                                onPressed: () {},
                                child: const Text(
                                  'View all',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: color3,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 300,
                          child: ListView.builder(
                              itemCount: listProvider.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => PackagePorovider(
                                  packagePro: listProvider[index])
                              // Container(child: Text('data'),)
                              ),
                        ),
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

class ImageHome {
  final String image;
  ImageHome({
    required this.image,
  });
}
