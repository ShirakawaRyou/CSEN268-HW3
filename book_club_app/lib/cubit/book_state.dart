import 'package:equatable/equatable.dart';
import '../models/book.dart';

abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object?> get props => [];
}

class BookLoading extends BookState {}

class BookListLoaded extends BookState {
  final List<Book> books;
  final bool sortByTitle;

  const BookListLoaded({required this.books, required this.sortByTitle});

  @override
  List<Object?> get props => [books, sortByTitle];
}

class BookDetailLoaded extends BookState {
  final Book selectedBook;

  const BookDetailLoaded(this.selectedBook);

  @override
  List<Object?> get props => [selectedBook];
}
