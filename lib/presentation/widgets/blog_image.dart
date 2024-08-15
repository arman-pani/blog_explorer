import 'package:flutter/material.dart';

class BlogImage extends StatelessWidget {
  final String imageURL;
  const BlogImage({super.key, required this.imageURL});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Theme.of(context).highlightColor.withOpacity(0.25),
          spreadRadius: 1,
          blurRadius: 5,
          offset: const Offset(0, 0),
        ),
      ], borderRadius: BorderRadius.circular(15)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          imageURL,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
          },
          errorBuilder: (context, error, stackTrace) {
            return const Center(child: Icon(Icons.error, size: 40));
          },
        ),
      ),
    );
  }
}
