import 'package:flutter/material.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';

class PackageHomes extends StatelessWidget {
  final Package package;
  const PackageHomes({
    Key? key,
    required this.package,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      
      width: MediaQuery.sizeOf(context).width * .45 ,
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
            alignment: AlignmentDirectional.topStart,
            children:[
                 Image.asset(
                  package.photo!,
                  fit: BoxFit.cover,
                  height: 175,
                  width:double.infinity ,
                ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    package.type!,
                    style: const TextStyle(
                        color: color4,
                         fontSize: 22,
                         fontWeight: FontWeight.bold),
                  ),
                ],
              ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(height: 150, width: 230,),
                      
                      Text(
                      ' \$ ${package.price} /mounth',
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
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10,),
              Text(
                package.name!,
                style: const TextStyle(
                  fontSize: 18,
                  color: color1,
                  fontWeight: FontWeight.w500,
                  fontFamily: AutofillHints.countryName,
                ),
              ),
             const SizedBox(height: 2,),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.star,
                  color: Colors.red,
                  size: 18,),
                  Text(
                    package.rating!,
                    style: const TextStyle(
                      fontSize: 18,
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
                    package.location!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: color1,
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 10,),
          
              
            ],
          )
        ],
      ),
    );
  }
}

class Package {
  final String? type;
  final String? name;
  final String? rating;
  final String? price;
  final String? photo;
  final String? location;
  Package({
    required this.type,
    required this.name,
    required this.rating,
    required this.price,
    required this.photo,
    required this.location,
  });
}