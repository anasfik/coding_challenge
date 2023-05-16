import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../data/models/soltana_model.dart';
import '../../data/repositories/soltana_repository.dart';
import '../../data/services/local.dart';

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
      _saveFetchedPostsToLocalDatabase(posts);
    } catch (e) {
      _loadPostsFromLocalDatabase();
    } finally {
      emit(state.copyWith(hasError: false));
    }
  }

  /// Fetches for more posts from the [repository] and emit the new states based on the results.
  ///
  /// This methods calls [_fetchPosts] internally, but ensures that we already fetched for the first page posts.
  Future<void> loadMorePosts() {
    // we ensure with this that we already fetched for the first page posts (we already called _fetchPosts before)
    assert(state.paginationIndex > 1);

    return _fetchPosts();
  }

  void _loadPostsFromLocalDatabase() {
    final savedPosts = LocalDatabase.instance.getSavedPosts();
    if (savedPosts.isNotEmpty) {
      emit(state.copyWith(posts: savedPosts));
    } else {
      emit(state.copyWith(posts: [], hasError: true));
    }
  }

  void _saveFetchedPostsToLocalDatabase(List<SoltanaPost> posts) {
    LocalDatabase.instance.savePosts(posts);
  }
}
