import 'dart:convert';

import 'package:blog_explorer/data/data_provider/blog_data_provider.dart';
import 'package:blog_explorer/models/blog_model.dart';

class BlogDataRepository {
  final BlogDataProvider blogDataProvider;

  BlogDataRepository(this.blogDataProvider);

  Future<List<BlogModel>> getBlogModelList() async {
    final blogData = await blogDataProvider.fetchBlogs();
    final List blogRawDataList = jsonDecode(blogData)['blogs'];
    final List<BlogModel> blogModelList = List.generate(blogRawDataList.length,
        (index) => BlogModel.fromMap(blogRawDataList[index]));
    return blogModelList;
  }
}
