import 'package:flutter/material.dart';

class MyImageWidget extends StatelessWidget {
  final String imagePath; // متغير يخزن مسار الصورة

  const MyImageWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    print(imagePath);
    return Image.network(
      '$imagePath',
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return const CircularProgressIndicator();
      },
      errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
    );
  }
}
