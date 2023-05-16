part of 'home_cubit.dart';

/// {@template home_state}
/// This is the responsible class for the state of the home page.
/// {@endtemplate}
@immutable
class HomeState extends Equatable {
  /// The list of posts that will be displayed in the home page.
  final List<SoltanaPost> posts;

  /// The index of the pagination, which will be used to load more posts.
  final int paginationIndex;

  /// {@macro home_state}
  const HomeState({
    this.posts = const [],
    this.paginationIndex = 1,
  });

  @override
  List<Object?> get props => [posts, paginationIndex];

  /// This generates a new state with the provided new values.
  HomeState copyWith({
    List<SoltanaPost>? posts,
    int? paginationIndex,
  }) {
    return HomeState(
      posts: posts ?? this.posts,
      paginationIndex: paginationIndex ?? this.paginationIndex,
    );
  }
}

/// The initial state of the home page.
class HomeInitial extends HomeState {}
