import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

part 'favorite_event.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, List<String>> {
  final Box favoriteBox;
  FavoriteBloc(this.favoriteBox) : super([]) {
    on<FavoriteLoaded>((event, emit) {
      final favoriteBlogs =
          List<String>.from(favoriteBox.get('favoriteBlogs', defaultValue: []));
      emit(favoriteBlogs);
    });
    on<FavoriteAdded>((event, emit) {
      state.add(event.blogId);
      favoriteBox.put('favoriteBlogs', state);
      emit([...state]);
    });
    on<FavoriteRemoved>((event, emit) {
      state.remove(event.blogId);
      favoriteBox.put('favoriteBlogs', state);
      emit([...state]);
    });
  }
}
