import 'package:equatable/equatable.dart';
import '../models/book.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<Object?> get props => [];
}

class LoadBooks extends BookEvent {}

class SortByAuthor extends BookEvent {}

class SortByTitle extends BookEvent {}

class ShowDetail extends BookEvent {
  final Book book;
  const ShowDetail(this.book);

  @override
  List<Object?> get props => [book];
}

class BackToList extends BookEvent {}
