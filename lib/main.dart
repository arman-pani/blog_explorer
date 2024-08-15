import 'package:blog_explorer/bloc/blog/blog_bloc.dart';
import 'package:blog_explorer/bloc/favorite/favorite_bloc.dart';
import 'package:blog_explorer/data/data_provider/blog_data_provider.dart';
import 'package:blog_explorer/data/repository/blog_data_repository.dart';
import 'package:blog_explorer/presentation/pages/blog_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('favoriteBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => BlogDataRepository(BlogDataProvider()),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BlogBloc(context.read<BlogDataRepository>()),
          ),
          BlocProvider(
            create: (context) => FavoriteBloc(Hive.box('favoriteBox')),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Blog Explorer',
          theme: ThemeData.dark(
            useMaterial3: true,
          ),
          home: const BlogListPage(),
        ),
      ),
    );
  }
}
