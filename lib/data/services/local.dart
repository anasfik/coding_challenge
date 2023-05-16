import 'package:coding_challenge_app/data/models/soltana_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'base/local.dart';

class LocalDatabase implements LocalDatabaseBase {
  static LocalDatabase _instance = LocalDatabase._();
  static LocalDatabase get instance => _instance;
  LocalDatabase._();

  @override
  List<SoltanaPost> getSavedPosts() {
    final box = Hive.box<SoltanaPost>('posts');
    return box.values.toList();
  }

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(SoltanaPostAdapter());
    await Hive.openBox<SoltanaPost>('posts');
  }

  @override
  Future<void> savePosts(List<SoltanaPost> posts) {
    final box = Hive.box<SoltanaPost>('posts');
    return box.addAll(posts);
  }
}
