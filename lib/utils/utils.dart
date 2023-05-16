import 'enum.dart';

class ApiBuilder {
  static ApiBuilder _instance = ApiBuilder._();

  static ApiBuilder get instance => _instance;
  ApiBuilder._({
    this.apiLink = "",
  });

  final String apiLink;

  ApiBuilder chainParam(String parametr) {
    return copyWith(
      apiLink: "${apiLink}/$parametr",
    );
  }

  ApiBuilder page(int pageIndex) {
    return copyWith(
      apiLink: "${apiLink}?page=$pageIndex",
    );
  }

  ApiBuilder apiLinkFromLinkType(ApiLinkType soltana) {
    switch (soltana) {
      case ApiLinkType.soltana:
        return copyWith(
          apiLink: 'http://soltana.ma/wp-json',
        );
      default:
        throw Exception('Invalid api link type');
    }
  }

  ApiBuilder copyWith({
    String? apiLink,
  }) {
    return ApiBuilder._(
      apiLink: apiLink ?? this.apiLink,
    );
  }
}
