import 'package:blog_explorer/models/blog_model.dart';
import 'package:blog_explorer/presentation/pages/detailed_blog_view.dart';
import 'package:blog_explorer/presentation/widgets/blog_item.dart';
import 'package:flutter/material.dart';

class BlogScrollView extends StatelessWidget {
  final List<BlogModel> blogModelList;
  final List<String> favoriteBlogIdList;
  const BlogScrollView({
    super.key,
    required this.blogModelList,
    required this.favoriteBlogIdList,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      clipBehavior: Clip.none,
      slivers: [
        SliverList.separated(
          itemCount: blogModelList.length,
          itemBuilder: (context, index) {
            final blogItem = blogModelList[index];
            final isFavorite = favoriteBlogIdList.contains(blogItem.id);
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailedBlogView(blogModel: blogItem),
                  ),
                );
              },
              child: BlogItem(
                blogModel: blogItem,
                isFavorite: isFavorite,
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 15),
        )
      ],
    );
  }
}
