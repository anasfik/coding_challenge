import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

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
      child: HtmlWidget(
        content,
        textStyle: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
