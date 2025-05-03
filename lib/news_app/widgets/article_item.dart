import 'package:flutter/material.dart';

import '../screens/article_details_screen.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key, required this.image, required this.url});
  final String image;
  final String url;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context){
          return ArticleDetailsScreen(
            url: url,
          );
        }));
      },
      child: Container(
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
      ),
    );
  }
}
