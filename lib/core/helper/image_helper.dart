import 'package:flutter/material.dart';

class MyImageWidget extends StatelessWidget {
  final String imagePath; // مسار الصورة، ممكن يحتوي على localhost

  const MyImageWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    // استبدال localhost بـ 10.0.2.2 إذا كانت موجودة
    final fixedUrl = imagePath.replaceFirst('localhost', '10.0.2.2');

    return Image.network(
      fixedUrl,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return const Center(child: CircularProgressIndicator());
      },
      errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
    );
  }
}
