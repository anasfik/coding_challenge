import 'package:coding_challenge_app/utils/extensions.dart';

import '../../utils/enum.dart';
import '../../utils/exceptions.dart';
import '../../utils/utils.dart';
import '../models/soltana_model.dart';
import 'base/soltana.dart';

import 'package:http/http.dart' as http;

/// {@template soltana_provider}
/// Consider this data provider as the low level of the data layer, which is responsible for making requests to the API. and returning a raw response.
/// {@endtemplate}
class SoltanaProvider implements SoltanaProviderBase {
  /// Fetches posts from the API and returns a type-safe [List<SoltanaPost>], but the encoding is done in the [onSuccess] callback that will be called after the request is done successfully.
  ///
  /// Throws [NetworkRequestException] if the request failed.
  @override
  Future<List<SoltanaPost>> posts(
    int index, {
    required Function(http.Response response) onSuccess,
  }) async {
    final apiLink = _buildSoltanaPostsApiLinkFromIndex(index);
    final uriApiLink = Uri.parse(apiLink);
    try {
      final response = await http.get(uriApiLink);
      if (response.statusCode.isNotOk) {
        throw NetworkRequestException(
          "Request failed with status code ${response.statusCode}",
        );
      } else {
        return onSuccess(response);
      }
    } catch (e) {
      throw NetworkRequestException(e.toString());
    }
  }

  String _buildSoltanaPostsApiLinkFromIndex(int index) {
    return ApiBuilder.instance
        .apiLinkFromLinkType(ApiLinkType.soltana)
        .chainParam("wp")
        .chainParam("v2")
        .chainParam("posts")
        .page(index)
        .apiLink;
  }
}
