import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      iconTheme: Theme.of(context).iconTheme.copyWith(
            size: 26,
            color: Colors.white,
          ),
      title: SizedBox(
        height: 50,
        width: 50,
        child: Placeholder(
          fallbackHeight: 50,
          fallbackWidth: 50,
          color: Colors.white,
        ),
      ),
    );
  }
}
