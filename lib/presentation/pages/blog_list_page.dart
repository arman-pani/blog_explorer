import 'package:blog_explorer/bloc/blog/blog_bloc.dart';
import 'package:blog_explorer/bloc/favorite/favorite_bloc.dart';
import 'package:blog_explorer/models/blog_model.dart';
import 'package:blog_explorer/presentation/widgets/blog_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogListPage extends StatefulWidget {
  const BlogListPage({super.key});

  @override
  State<BlogListPage> createState() => _BlogListPageState();
}

class _BlogListPageState extends State<BlogListPage> {
  @override
  void initState() {
    super.initState();
    context.read<BlogBloc>().add(BlogFetched());
    context.read<FavoriteBloc>().add(FavoriteLoaded());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Blog Explorer"),
          titleTextStyle: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'ALL'),
              Tab(text: 'FAVORITE'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildBlogTab(onlyFavorites: false),
            _buildBlogTab(onlyFavorites: true),
          ],
        ),
      ),
    );
  }

  Widget _buildBlogTab({required bool onlyFavorites}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: BlocConsumer<BlogBloc, BlogState>(
        listener: (context, state) {
          if (state is BlogFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          if (state is! BlogSuccess) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          List<BlogModel> blogModelList = state.blogModelList;
          return BlocBuilder<FavoriteBloc, List<String>>(
            builder: (context, state) {
              if (onlyFavorites) {
                blogModelList = List.from(
                    blogModelList.where((blog) => state.contains(blog.id)));
              }
              return BlogScrollView(
                blogModelList: blogModelList,
                favoriteBlogIdList: state,
              );
            },
          );
        },
      ),
    );
  }
}
