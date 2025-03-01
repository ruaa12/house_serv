// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter/material.dart';

import 'package:home_serviece/feature/home/presentation/widget/package_service.dart';


class ServicesScreen extends StatefulWidget {
    static String id = 'serviceScreen';

  final Service? service;
  
  
  const ServicesScreen({
    Key? key,
     this.service,
  }) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {

List<DetService> listServices = [

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
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text('Popular Services'),
      
      
       
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: 
       
         
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                    itemCount: listServices.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true ,
                    itemBuilder: (context, index) =>
                        PackageService(
                          detService:listServices[index]
                         )
                   , 
                   
                      ) )  ,),
                
              
          
          
          
        
      )
      
      
    );
  }
}