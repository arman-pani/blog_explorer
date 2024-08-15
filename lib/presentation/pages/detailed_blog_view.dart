import 'package:blog_explorer/bloc/favorite/favorite_bloc.dart';
import 'package:blog_explorer/models/blog_model.dart';
import 'package:blog_explorer/presentation/widgets/blog_image.dart';
import 'package:blog_explorer/presentation/widgets/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailedBlogView extends StatelessWidget {
  final BlogModel blogModel;
  const DetailedBlogView({super.key, required this.blogModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blog View"),
        titleSpacing: 0,
        titleTextStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          BlocBuilder<FavoriteBloc, List<String>>(
            builder: (context, state) {
              final bool isFavorite = state.contains(blogModel.id);
              return FavoriteButton(
                  isFavorite: isFavorite, blogModel: blogModel);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlogImage(imageURL: blogModel.imageURL),
            const SizedBox(height: 10),
            Text(
              blogModel.title,
              style: const TextStyle(
                fontSize: 24,
                height: 1.2,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
