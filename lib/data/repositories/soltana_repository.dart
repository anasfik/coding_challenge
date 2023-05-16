import 'dart:convert';
import '../models/soltana_model.dart';
import '../providers/soltana_provider.dart';
import 'base/soltana.dart';

/// {@template soltana_repository}
/// This repository responsible of fetching posts from the [SoltanaProvider].
/// {@endtemplate}
class SoltanaRepository implements SoltanaRepositoryBase {
  /// The provider that will be used to fetch posts.
  SoltanaProvider? _provider;

  /// Fetched posts from the [SoltanaProvider] of page with [index] and decodes the response body to a type-safe [List<SoltanaPost>].
  @override
  Future<List<SoltanaPost>> posts(int index) {
    // while debugging, we wanna make sure that the provider is set.
    assert(_provider != null);

    return _provider!.posts(
      index,
      onSuccess: (response) {
        final decodedBody = jsonDecode(response.body) as List;

        return List.generate(
          decodedBody.length,
          (index) => SoltanaPost.fromMap(decodedBody[index]),
        );
      },
    );
  }

  /// {@macro soltana_repository}
  SoltanaRepository() {
    _provider = SoltanaProvider();
  }
}
