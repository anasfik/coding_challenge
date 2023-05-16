import 'package:coding_challenge_app/data/models/soltana_model.dart';
import 'package:flutter/material.dart';

class SoltanaPostCard extends StatelessWidget {
  const SoltanaPostCard({
    super.key,
    required this.post,
  });

  final SoltanaPost post;
  @override
  Widget build(BuildContext context) {
    return Text(post.title);
  }
}
