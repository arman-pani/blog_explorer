import 'package:blog_explorer/bloc/favorite/favorite_bloc.dart';
import 'package:blog_explorer/models/blog_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final BlogModel blogModel;
  const FavoriteButton({
    super.key,
    required this.isFavorite,
    required this.blogModel,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (isFavorite) {
          context
              .read<FavoriteBloc>()
              .add(FavoriteRemoved(blogId: blogModel.id));
        } else {
          context.read<FavoriteBloc>().add(FavoriteAdded(blogId: blogModel.id));
        }
      },
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border_rounded,
        color: Colors.red,
      ),
    );
  }
}
