import 'package:blog_explorer/data/repository/blog_data_repository.dart';
import 'package:blog_explorer/models/blog_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final BlogDataRepository blogDataRepository;

  BlogBloc(this.blogDataRepository) : super(BlogInitial()) {
    on<BlogFetched>((event, emit) async {
      emit(BlogLoading());
      try {
        final blogModelList = await blogDataRepository.getBlogModelList();
        emit(BlogSuccess(blogModelList: blogModelList));
      } catch (e) {
        return emit(BlogFailure(error: e.toString()));
      }
    });
  }
}
