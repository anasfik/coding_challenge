import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'soltana_model.g.dart';

@HiveType(typeId: 1)
class SoltanaPost extends Equatable {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String content;

  @HiveField(2)
  final String imagePath;

  @HiveField(3)
  final String? category;

  @HiveField(4)
  final DateTime? date;

  const SoltanaPost({
    required this.title,
    required this.content,
    this.imagePath = 'https://picsum.photos/200/300',
    this.category,
    this.date,
  });

  factory SoltanaPost.fromMap(Map<String, dynamic> map) {
    return SoltanaPost(
      title: map['title']['rendered'] as String,
      content: map['content']['rendered'] as String,
      imagePath: (map['og_image'] as List).first["url"] as String,
    );
  }

  @override
  List<Object?> get props => [title, content, imagePath];
}
