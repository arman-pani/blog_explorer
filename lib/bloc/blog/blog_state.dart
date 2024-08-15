part of 'blog_bloc.dart';

@immutable
sealed class BlogState {}

final class BlogInitial extends BlogState {}

final class BlogSuccess extends BlogState {
  final List<BlogModel> blogModelList;

  BlogSuccess({required this.blogModelList});
}

final class BlogFailure extends BlogState {
  final String error;

  BlogFailure({required this.error});
}

final class BlogLoading extends BlogState {}
