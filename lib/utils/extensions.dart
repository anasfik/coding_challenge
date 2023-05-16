extension IntExtension on int {
  bool get isNotOk => this < 200 || this >= 300;
}

extension DateTimeExtension on DateTime {
  String get arabicFormatted {
    final date = this;
    final months = [
      "يناير",
      "فبراير",
      "مارس",
      "أبريل",
      "مايو",
      "يونيو",
      "يوليو",
      "أغسطس",
      "سبتمبر",
      "أكتوبر",
      "نوفمبر",
      "ديسمبر",
    ];
    return "${date.year} ${months[date.month - 1]} ${date.day}";
  }
}
