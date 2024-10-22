import 'package:flutter/material.dart';

class CharacterImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  const CharacterImage({
    Key? key,
    required this.imageUrl,
    this.width = 100.0,
    this.height = 120.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        width: width,
        height: height,
        child: Image.network(
          imageUrl,
          fit: BoxFit.fill,
          errorBuilder: (context, error, stackTrace) {
            return Icon(
              Icons.error,
              size: width,
            );
          },
        ),
      ),
    );
  }
}
