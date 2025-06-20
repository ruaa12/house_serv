import 'package:flutter/material.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';

import 'package:home_serviece/feature/estate/data/models/get_houses.dart';

class EstateCard extends StatelessWidget {
  final HouseModel estate;
  const EstateCard({super.key, required this.estate});

  String fixImageUrl(String url) {
  return url.replaceAll("localhost", "10.0.2.2");
}


  @override
  Widget build(BuildContext context) {
    print('🧱 عرض EstateCard للعقار: ${estate.title}');

    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        width: 220,
        height: 300,
        margin: const EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          color: color2,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: color1.withOpacity(0.3),
              blurRadius: 5,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              child: estate.images != null && estate.images!.isNotEmpty
              
                  ?
                   Image.network(
                     fixImageUrl( estate.images!.first),
                      fit: BoxFit.cover,
                      height: 120,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 130,
                          width: double.infinity,
                          color: color4,
                          alignment: Alignment.center,
                          child: Icon(Icons.error, size: 40, color: color1),
                        );
                      },
                    )
                  : Container(
                      height: 130,
                      width: double.infinity,
                      color: color4,
                      alignment: Alignment.center,
                      child: Icon(Icons.image_not_supported,
                          size: 40, color: color1),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    estate.title!,
                    style: TextStyle(
                        fontSize: 12,
                        color: color3,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    estate.description!,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: color1),
                  ),
                  const SizedBox(height: 6),
                  // Row(
                  //   children: [
                  //     Icon(Icons.location_on, size: 14, color: color2),
                  //     const SizedBox(width: 4),
                  //     // Expanded(
                  //     //   child: Text(
                  //     //     estate.,
                  //     //     style: TextStyle(fontSize: 12, color: color5),
                  //     //     overflow: TextOverflow.ellipsis,
                  //     //   ),
                  //     // ),
                  //   ],
                  // ),
                  // const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Row(
                      //   children: [
                      //     Icon(Icons.star, size: 14, color: Colors.amber),
                      //     const SizedBox(width: 4),
                      //     Text(
                      //       estate..toString(),
                      //       style: TextStyle(fontSize: 12, color: color5),
                      //     ),
                      //   ],
                      // ),
                      Text(
                        'Price: ${estate.price.toString() ?? 'Not Available'}',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: color3),
                      ),
                    ],
                  ),
                  // const SizedBox(height: 6),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text('Area: ${estate.?.toString() ?? 'Unknown'} sqm',
                  //         style: TextStyle(fontSize: 12, color: color5)),
                  //     Text('Rooms: ${estate.rooms?.toString() ?? 'N/A'}',
                  //         style: TextStyle(fontSize: 12, color: color5)),
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
