import 'package:equatable/equatable.dart';

class SoltanaPost extends Equatable {
  final String title;
  final String content;
  final String imagePath;

  const SoltanaPost({
    required this.title,
    required this.content,
    this.imagePath = 'https://picsum.photos/200/300',
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
