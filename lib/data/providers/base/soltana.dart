import 'package:http/http.dart';

abstract class SoltanaProviderBase {
  Future posts(
    int index, {
    required Function(Response response) onSuccess,
  });
}
