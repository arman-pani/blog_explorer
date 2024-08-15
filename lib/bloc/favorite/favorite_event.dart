part of 'favorite_bloc.dart';

@immutable
sealed class FavoriteEvent {}

final class FavoriteAdded extends FavoriteEvent {
  final String blogId;

  FavoriteAdded({required this.blogId});
}

final class FavoriteRemoved extends FavoriteEvent {
  final String blogId;

  FavoriteRemoved({required this.blogId});
}

final class FavoriteLoaded extends FavoriteEvent {}
