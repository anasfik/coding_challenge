import 'package:coding_challenge_app/data/models/soltana_model.dart';
import 'package:coding_challenge_app/utils/extensions.dart';
import 'package:flutter/material.dart';

class SoltanaPostCard extends StatelessWidget {
  const SoltanaPostCard({
    super.key,
    required this.post,
  });

  final SoltanaPost post;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  post.imagePath,
                  width: double.infinity,
                  height: 200.0,
                  fit: BoxFit.fitWidth,
                  loadingBuilder: (context, child, loadingProgress) {
                    return Container(
                      height: 200.0,
                      width: double.infinity,
                      color: Colors.grey.shade300,
                    );
                  },
                ),
              ),
              Positioned(
                bottom: -10,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 2.0, horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    "الرئيسية",
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15.0),
          Text(
            post.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 5.0),
          Text(
            post.date!.arabicFormatted,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Colors.grey.shade600,
                ),
          ),
          const SizedBox(height: 15.0),
        ],
      ),
    );
  }
}
