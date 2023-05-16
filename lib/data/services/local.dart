import 'package:coding_challenge_app/data/models/soltana_model.dart';

import 'base/local.dart';

class LocalDatabase implements LocalDatabaseBase {
  static LocalDatabase _instance = LocalDatabase._();
  static LocalDatabase get instance => _instance;
  LocalDatabase._();

  @override
  List<SoltanaPost> getSavedPosts() {
    // TODO: implement getSavedPosts
    throw UnimplementedError();
  }

  @override
  Future<void> init() {
    // TODO: implement init
    throw UnimplementedError();
  }

  @override
  Future<void> savePosts() {
    // TODO: implement savePosts
    throw UnimplementedError();
  }
}
