import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final String imageUrl;
  final String title;
  final String author;
  final String description;

  const Book({
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.description,
  });

  @override
  List<Object?> get props => [imageUrl, title, author, description];
}
