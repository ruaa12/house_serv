import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyImageWidget extends StatelessWidget {
  final String imagePath; // متغير يخزن مسار الصورة

  const MyImageWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    // استبدال localhost بـ 10.0.2.2 إذا كانت موجودة
    final fixedUrl = imagePath.replaceFirst('localhost', '10.0.2.2');
    return GestureDetector(
        onTap: () {
          print(fixedUrl);
        },
        child: CachedNetworkImage(
          httpHeaders: {'Connection': 'Keep-Alive'},
          imageUrl: imagePath,
          errorWidget: (context, url, error) =>
              Card(child: Text(error.toString())),
        ));
  }
}
