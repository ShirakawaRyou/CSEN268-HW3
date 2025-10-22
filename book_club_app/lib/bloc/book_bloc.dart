import 'package:flutter_bloc/flutter_bloc.dart';
import 'book_event.dart';
import 'book_state.dart';
import '../models/book.dart';
import '../data/books_data.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final List<Book> _allBooks = [];

  BookBloc() : super(BookLoading()) {
    on<LoadBooks>((event, emit) {
      _allBooks.addAll(initialBooks);
      final sorted = [..._allBooks]..sort((a, b) => a.author.compareTo(b.author));
      emit(BookListLoaded(books: sorted, sortByTitle: false));
    });

    on<SortByAuthor>((event, emit) {
      emit(BookLoading());
      final sorted = [..._allBooks]..sort((a, b) => a.author.compareTo(b.author));
      emit(BookListLoaded(books: sorted, sortByTitle: false));
    });

    on<SortByTitle>((event, emit) {
      emit(BookLoading());
      final sorted = [..._allBooks]..sort((a, b) => a.title.compareTo(b.title));
      emit(BookListLoaded(books: sorted, sortByTitle: true));
    });

    on<ShowDetail>((event, emit) {
      emit(BookDetailLoaded(event.book));
    });

    on<BackToList>((event, emit) {
      final sorted = [..._allBooks]..sort((a, b) => a.author.compareTo(b.author));
      emit(BookListLoaded(books: sorted, sortByTitle: false));
    });

    add(LoadBooks());
  }
}
