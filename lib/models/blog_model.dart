import 'dart:convert';

class BlogModel {
  final String id;
  final String title;
  final String imageURL;
  BlogModel({
    required this.id,
    required this.title,
    required this.imageURL,
  });

  BlogModel copyWith({
    String? id,
    String? title,
    String? imageURL,
  }) {
    return BlogModel(
      id: id ?? this.id,
      title: title ?? this.title,
      imageURL: imageURL ?? this.imageURL,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image_url': imageURL,
    };
  }

  factory BlogModel.fromMap(Map<String, dynamic> map) {
    return BlogModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      imageURL: map['image_url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BlogModel.fromJson(String source) =>
      BlogModel.fromMap(json.decode(source));

  @override
  String toString() => 'BlogModel(id: $id, title: $title, imageURL: $imageURL)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BlogModel &&
        other.id == id &&
        other.title == title &&
        other.imageURL == imageURL;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ imageURL.hashCode;
}
