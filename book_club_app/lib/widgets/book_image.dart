import 'package:flutter/material.dart';

class BookImage extends StatelessWidget {
  final String imageUrl;

  const BookImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageUrl.startsWith('http')) {
      return Image.network(
        imageUrl,
        width: 100,
        height: 150,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        imageUrl,
        width: 100,
        height: 150,
        fit: BoxFit.cover,
      );
    }
  }
}
