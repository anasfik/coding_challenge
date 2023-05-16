import 'package:flutter/material.dart';

class SoltanaPostFullScreenText extends StatelessWidget {
  const SoltanaPostFullScreenText({
    super.key,
    required this.content,
  });

  final String content;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(content),
    );
  }
}
