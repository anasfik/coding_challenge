import 'package:bloc/bloc.dart';
import 'package:coding_challenge_app/utils/extensions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../data/models/soltana_model.dart';
import '../../data/models/tab_item.dart';
import '../../data/repositories/soltana_repository.dart';
import '../../data/services/local.dart';

part 'home_state.dart';

/// {@template home_cubit}
/// This cubit responsible of managing the home screen state.
/// {@endtemplate}
class HomeCubit extends Cubit<HomeState> {
  /// The repository that will be used to fetch the posts.
  final SoltanaRepository repository;

  /// The scroll controller that will be used to detect the end of the page and load more posts.
  ScrollController? scrollController;

  /// The list of the tabs that will be displayed in the home screen.
  List<TabItem> get tabItems => const [
        TabItem(name: 'الرئيسية'),
        TabItem(name: 'الرئيسية'),
        TabItem(name: 'الرئيسية'),
        TabItem(name: 'الرئيسية'),
        TabItem(name: 'الرئيسية'),
        TabItem(name: 'الرئيسية'),
        TabItem(name: 'الرئيسية'),
        TabItem(name: 'الرئيسية'),
        TabItem(name: 'الرئيسية'),
        TabItem(name: 'الرئيسية'),
        TabItem(name: 'الرئيسية'),
        TabItem(name: 'الرئيسية'),
        TabItem(name: 'الرئيسية'),
      ];

  HomeCubit({
    required this.repository,
  }) : super(HomeInitial()) {
    scrollController = ScrollController()
      ..addListener(() {
        if (scrollController!.nearToReachEndOfPage) {
          emit(state.copyWith(isFetching: true));
          loadMorePosts();
        }
      });

    _fetchPosts();
  }

  /// Fetch posts from the [repository] and emit the new states based on the results.
  ///
  /// Increment the [HomeState.paginationIndex] by one after each successful fetch.
  Future<void> _fetchPosts() async {
    try {
      final paginationIndex = state.paginationIndex;

      final currentFetchPosts = await repository.posts(paginationIndex);

      final posts = [...state.posts, ...currentFetchPosts];
      posts.sort((a, b) => b.date!.compareTo(a.date!));
      emit(state.copyWith(
        posts: posts,
        paginationIndex: paginationIndex + 1,
        hasError: false,
      ));

      _saveFetchedPostsToLocalDatabase(posts);
    } catch (e) {
      _loadPostsFromLocalDatabase();
    } finally {
      emit(state.copyWith(isFetching: false));
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

  /// Fetches for the saved posts from the local database and emit them as a ne state.
  void _loadPostsFromLocalDatabase() {
    final savedPosts = LocalDatabase.instance.getSavedPosts();
    savedPosts.sort((a, b) => b.date!.compareTo(a.date!));

    if (savedPosts.isNotEmpty) {
      emit(state.copyWith(posts: savedPosts));
    } else {
      emit(state.copyWith(posts: [], hasError: true));
    }
  }

  /// Saves the given [posts] to the local database to be used later.
  void _saveFetchedPostsToLocalDatabase(List<SoltanaPost> posts) {
    LocalDatabase.instance.savePosts(posts);
  }
}
