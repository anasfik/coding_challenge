import 'package:coding_challenge_app/data/models/soltana_model.dart';
import 'package:flutter/material.dart';

import '../home/widgets/card.dart';

class SoltanaPostFullScreen extends StatelessWidget {
  const SoltanaPostFullScreen({
    super.key,
    required this.post,
  });

  final SoltanaPost post;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SoltanaPostCard(post: post),
        ],
      ),
    );
  }
}
