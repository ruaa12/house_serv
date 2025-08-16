import 'package:flutter/material.dart';
import 'package:home_serviece/core/helper/image_helper.dart';

<<<<<<< HEAD
import 'package:home_serviece/feature/estate/data/models/get_houses.dart';
=======
import '../../../home/presentation/widget/const.dart';
import '../../data/models/get_houses.dart';
import '../screen/estate_details_screen.dart';
>>>>>>> a20141485a376f901dd53047eccdab5f8060d062

class EstateCard extends StatelessWidget {
  final HouseModel estate;
  const EstateCard({super.key, required this.estate});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
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
                  ? Image.network(
                      estate.images!.first,
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
=======
    print('🧱 عرض EstateCard للعقار: ${estate.title}');

    return GestureDetector( // 🟡 أضفنا GestureDetector للكارد ككل
      onTap: () {
        if (estate.id != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => EstateDetailsScreen(estateId: estate.id!), // 🟢 تمرير estateId
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("المعرف غير متوفر لهذا العقار")),
          );
        }
      },
      child: Padding(
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
>>>>>>> a20141485a376f901dd53047eccdab5f8060d062
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: estate.images != null && estate.images!.isNotEmpty
                    ? MyImageWidget(imagePath: estate.images!.first)
                    : Container(
                        height: 130,
                        width: double.infinity,
                        color: color4,
                        alignment: Alignment.center,
                        child: Icon(Icons.image_not_supported, size: 40, color: color1),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      estate.title ?? 'بدون عنوان',
                      style: TextStyle(fontSize: 12, color: color3, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      estate.description ?? 'لا يوجد وصف',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color1),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Price: ${estate.price ?? 'Not Available'}',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: color3),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
