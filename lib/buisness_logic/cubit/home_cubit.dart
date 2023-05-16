import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../data/models/soltana_model.dart';
import '../../data/repositories/soltana_repository.dart';

part 'home_state.dart';

/// {@template home_cubit}
/// This cubit responsible of managing the home screen state.
/// {@endtemplate}
class HomeCubit extends Cubit<HomeState> {
  final SoltanaRepository repository;
  HomeCubit({
    required this.repository,
  }) : super(HomeInitial());

  /// Fetch posts from the [repository] and emit the new states based on the results.
  ///
  /// Increment the [HomeState.paginationIndex] by one after each successful fetch.
  Future<void> _fetchPosts() async {
    try {
      final paginationIndex = state.paginationIndex;

      final currentFetchPosts = await repository.posts(paginationIndex);

      final posts = [...state.posts, ...currentFetchPosts];
      emit(state.copyWith(posts: posts, paginationIndex: paginationIndex + 1));
    } catch (e) {
      UnimplementedError();
    }
  }
}
