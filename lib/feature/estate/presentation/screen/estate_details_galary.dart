import 'package:flutter/material.dart';

import 'galary_full_screen_view.dart';

class EstateDetailsGallery extends StatelessWidget {
  final List<String> images;

  const EstateDetailsGallery({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: images.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 6,
        mainAxisSpacing: 6,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // افتح صورة fullscreen مع تمرير index
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => GalleryFullScreenView(
                  images: images,
                  initialIndex: index,
                ),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              images[index],
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.error_outline,
                    color: Colors.blueGrey,
                    size: 40,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
