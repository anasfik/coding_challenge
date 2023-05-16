import 'package:flutter/material.dart';

class SoltanaPostFullScreenAppBar extends StatelessWidget
    with PreferredSizeWidget {
  const SoltanaPostFullScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: Theme.of(context).dividerColor,
          height: 1.0,
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
      iconTheme: Theme.of(context).iconTheme.copyWith(
            size: 26,
            color: Theme.of(context).primaryColor,
          ),
      title: Image.network(
        "https://placehold.it/150x150",
        height: 50,
        width: 50,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 1.05);
}
