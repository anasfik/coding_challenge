import 'package:coding_challenge_app/data/models/soltana_model.dart';

abstract class LocalDatabaseBase {
  Future<void> init();
  List<SoltanaPost> getSavedPosts();
  Future<void> savePosts();
}
