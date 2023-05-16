extension IntExtension on int {
  bool get isNotOk => this < 200 || this >= 300;
}
