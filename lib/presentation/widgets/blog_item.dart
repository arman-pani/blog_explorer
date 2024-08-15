import 'package:blog_explorer/models/blog_model.dart';
import 'package:blog_explorer/presentation/widgets/blog_image.dart';
import 'package:blog_explorer/presentation/widgets/favorite_button.dart';
import 'package:flutter/material.dart';

class BlogItem extends StatelessWidget {
  final BlogModel blogModel;
  final bool isFavorite;
  const BlogItem({
    super.key,
    required this.isFavorite,
    required this.blogModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).highlightColor,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).highlightColor.withOpacity(0.25),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 0),
            ),
          ],
          borderRadius: BorderRadius.circular(15)),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                BlogImage(imageURL: blogModel.imageURL),
                Align(
                    alignment: Alignment.topRight,
                    child: FavoriteButton(
                        isFavorite: isFavorite, blogModel: blogModel)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                blogModel.title,
                style: const TextStyle(
                  fontSize: 20,
                  height: 1.2,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ]),
    );
  }
}
