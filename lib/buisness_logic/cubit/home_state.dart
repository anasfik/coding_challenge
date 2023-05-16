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

  /// Whether there is an error while fetching the posts or not.
  final bool hasError;

  /// Wether the posts are being fetched or not.
  final bool isFetching;

  /// {@macro home_state}
  const HomeState({
    this.posts = const [],
    this.paginationIndex = 1,
    this.hasError = false,
    this.isFetching = false,
  });

  @override
  List<Object?> get props => [posts, paginationIndex, hasError, isFetching];

  /// This generates a new state with the provided new values.
  HomeState copyWith({
    List<SoltanaPost>? posts,
    int? paginationIndex,
    bool? hasError,
    bool? isFetching,
  }) {
    return HomeState(
      posts: posts ?? this.posts,
      paginationIndex: paginationIndex ?? this.paginationIndex,
      hasError: hasError ?? this.hasError,
      isFetching: isFetching ?? this.isFetching,
    );
  }
}

/// The initial state of the home page.
class HomeInitial extends HomeState {}
