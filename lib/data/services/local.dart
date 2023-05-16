import 'package:coding_challenge_app/data/models/soltana_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'base/local.dart';

/// {@template local_database}
/// Manages the local database that will be used to save the fetched posts.
/// {@endtemplate}
class LocalDatabase implements LocalDatabaseBase {
  /// {@macro local_database}
  static LocalDatabase _instance = LocalDatabase._();

  /// {@macro local_database}
  static LocalDatabase get instance => _instance;

  /// {@macro local_database}
  LocalDatabase._();

  /// Retrieves the saved posts from the local database if there is any.
  @override
  List<SoltanaPost> getSavedPosts() {
    final box = Hive.box<SoltanaPost>('posts');
    return box.values.toList();
  }

  /// Initializes the local database, and registers the [SoltanaPost] adapter.
  @override
  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(SoltanaPostAdapter());
    await Hive.openBox<SoltanaPost>('posts');
  }

  /// Saves the given [posts] to the local database to be used later.
  @override
  Future<void> savePosts(List<SoltanaPost> posts) {
    final box = Hive.box<SoltanaPost>('posts');
    return box.addAll(posts);
  }
}
