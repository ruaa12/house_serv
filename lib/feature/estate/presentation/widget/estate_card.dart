import 'package:flutter/material.dart';
import 'package:home_serviece/core/helper/image_helper.dart';

import '../../../home/presentation/widget/const.dart';
import '../../data/models/get_houses.dart';
import '../screen/estate_details_screen.dart';

class EstateCard extends StatelessWidget {
  final HouseModel estate;
  const EstateCard({super.key, required this.estate});

  @override
  Widget build(BuildContext context) {
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
