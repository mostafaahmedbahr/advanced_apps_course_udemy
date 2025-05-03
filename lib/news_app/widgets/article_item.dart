import 'package:flutter/material.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: double.infinity,
      child: Column(
        children: [
          Image.network(image,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 250,
                width: double.infinity,
                color: Colors.grey[200],
                child: const Icon(Icons.broken_image, size: 50, color: Colors.grey),
              );
            },
          height: 250,
          width: double.infinity,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
