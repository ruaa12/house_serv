// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter/material.dart';

import 'package:home_serviece/feature/home/presentation/screen/details_service.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';


class PackageService extends StatelessWidget {
  
  final DetService? detService;
  final Service? service;
  


  PackageService({
    Key? key,
    required this.detService,
    this.service,
  }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
       children: [
         GestureDetector(

          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => const DetailsService() ));
          },
           child: CircleAvatar(
            
             child: Image.asset(detService!.imageSer),
             backgroundColor: color2,
             maxRadius: 45,
           ),
         ), 
        
         Text( detService!.titleSer,
         style:const TextStyle(
           color: color1,
           fontSize: 16,
         ),)
       ],
      ),
    );
  }
}

class Service {
  final String typeService;
  final List<DetService> detailService;
  Service({
    required this.typeService,
    required this.detailService,
  });
}


class DetService {
  final String imageSer;
  final String titleSer;
  // final List<PackagePro> detProvider;
  DetService({
    required this.imageSer,
    required this.titleSer,
    // required this.detProvider,
  });
}
