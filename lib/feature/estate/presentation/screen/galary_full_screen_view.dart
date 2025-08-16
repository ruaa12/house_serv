import 'package:flutter/material.dart';

class GalleryFullScreenView extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const GalleryFullScreenView({
    Key? key,
    required this.images,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  State<GalleryFullScreenView> createState() => _GalleryFullScreenViewState();
}

class _GalleryFullScreenViewState extends State<GalleryFullScreenView> {
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('${widget.initialIndex + 1} / ${widget.images.length}'),
        leading: BackButton(color: Colors.white),
      ),
      body: PageView.builder(
        controller: _controller,
        itemCount: widget.images.length,
        itemBuilder: (context, index) {
          return InteractiveViewer(
            child: Image.network(
              widget.images[index],
              fit: BoxFit.contain,
            ),
          );
        },
        onPageChanged: (index) {
          setState(() {
            // لتحديث العنوان في AppBar إذا حبيتي
          });
        },
      ),
    );
  }
}
