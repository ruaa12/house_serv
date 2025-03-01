// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:home_serviece/feature/home/presentation/widget/const.dart';

class PackagePorovider extends StatelessWidget {
  final PackagePro packagePro;
  const PackagePorovider({
    Key? key,
    required this.packagePro,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(10),
      
      width: 200,
      height: 300,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color6,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 9,
              offset: const Offset(0, 3))
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children:[
                 Image.asset(
                  packagePro.photo!,
                  fit: BoxFit.cover,
                  height: 150,
                  width: 150,
                ),
              
             
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(height: 120, width: 230,),
                      
                      Text(
                      ' \$ ${packagePro.price} /hour',
                     style:const TextStyle(
                      fontSize: 18,
                      color: color4,
                      backgroundColor: color3
                                      ),
                                    ),
                    ],
                  ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15, right: 10
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15,),
                Text(
                  packagePro.name!,
                  style: const TextStyle(
                    fontSize: 18,
                    color: color1,
                    fontWeight: FontWeight.w500,
                    fontFamily: AutofillHints.countryName,
                  ),
                ),
                
                  
                    Text(
                      packagePro.type!,
                      style: const TextStyle(
                          color: color1,
                           fontSize: 18,
                           ),
                    ),
                  
               const SizedBox(height: 7,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.star,
                    color: Colors.red,
                    size: 16,),
                    Text(
                      packagePro.rating!,
                      style: const TextStyle(
                        fontSize: 16,
                        color: color1,
                      ),
                    ),
                  ]
                ),
                   
                    Row(
                      children: [
                     const Icon(Icons.location_pin,
                     color: color2,
                     size: 18,),
                    Text(
                      packagePro.location!,
                      style: const TextStyle(
                        fontSize: 16,
                        color: color1,
                      ),
                    ),
                      ]
                    ),
                  
                
                // const SizedBox(height: 10,),
            
                
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PackagePro {
  final String? type;
  final String? name;
  final String? rating;
  final String? price;
  final String? photo;
  final String? location;
  final int? phone;
  final int? experiance;
  final String? bio;
  final List<String>? Gallery;
  PackagePro({
    required this.type,
    required this.name,
    required this.rating,
    required this.price,
    required this.photo,
    required this.location,
    required this.phone,
    required this.experiance,
    required this.bio,
    required this.Gallery,
  });
}
