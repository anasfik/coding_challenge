import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'soltana_model.g.dart';

/// {@template soltana_post}
/// Represents a post data model that will be used in the app.
/// {@endtemplate}
@HiveType(typeId: 1)
class SoltanaPost extends Equatable {
  /// The title of the post.
  @HiveField(0)
  final String title;

  /// The content of the post.
  @HiveField(1)
  final String content;

  /// The image path of the post.
  @HiveField(2)
  final String imagePath;

  /// The category of the post.
  @HiveField(3)
  final String? category;

  /// The date of the post.
  @HiveField(4)
  final DateTime? date;

  /// {@macro soltana_post}
  const SoltanaPost({
    required this.title,
    required this.content,
    this.imagePath = 'https://picsum.photos/200/300',
    this.category,
    this.date,
  });

  /// Creates a [SoltanaPost] from a map.
  factory SoltanaPost.fromMap(Map<String, dynamic> map) {
    return SoltanaPost(
      title: map['title']['rendered'] as String,
      content: map['content']['rendered'] as String,
      imagePath:
          (map["yoast_head_json"]['og_image'] as List).first["url"] as String,
      date: DateTime.parse(map["date"] as String),
    );
  }

  @override
  List<Object?> get props => [title, content, imagePath, category, date];
}
