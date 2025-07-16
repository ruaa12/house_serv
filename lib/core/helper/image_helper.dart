import 'package:flutter/material.dart';

class MyImageWidget extends StatelessWidget {
  final String imagePath;  // متغير يخزن مسار الصورة

  const MyImageWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'http://10.0.2.2/storage/$imagePath',
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return const CircularProgressIndicator();
      },
      errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
    );
  }
}

// استخدام الويدجيت:
