import 'package:flutter/material.dart';

class MyImageWidget extends StatelessWidget {
<<<<<<< HEAD
  final String imagePath; // متغير يخزن مسار الصورة
=======
  final String imagePath; // مسار الصورة، ممكن يحتوي على localhost
>>>>>>> a20141485a376f901dd53047eccdab5f8060d062

  const MyImageWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    print(imagePath);
    return Image.network(
      '$imagePath',
=======
    // استبدال localhost بـ 10.0.2.2 إذا كانت موجودة
    final fixedUrl = imagePath.replaceFirst('localhost', '10.0.2.2');

    return Image.network(
      fixedUrl,
>>>>>>> a20141485a376f901dd53047eccdab5f8060d062
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return const Center(child: CircularProgressIndicator());
      },
      errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
    );
  }
}
