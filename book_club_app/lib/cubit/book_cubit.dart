import 'package:bloc/bloc.dart';
import 'book_state.dart';
import '../models/book.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(BookLoading()) {
    _loadBooks();
  }

  final List<Book> _allBooks = [];

  void _loadBooks() {
    final books = <Book>[
      Book(
        imageUrl: 'assets/images/dont_look_back.png',
        title: "Don't Look Back",
        author: 'Isaac Nelson',
        description: 'Voted Best Thriller Novel 20XX',
      ),
      Book(
        imageUrl: 'assets/images/charmer_and_grit.png',
        title: 'Charmer and Grit',
        author: 'Sarah Jean Horwitz',
        description: 'Book One: The Wingsnatchers',
      ),
      Book(
        imageUrl: 'assets/images/little_gods.png',
        title: 'Little Gods',
        author: 'Meng Jin',
        description: 'A novel by Meng Jin',
      ),
      Book(
        imageUrl: 'assets/images/clockwork_orange.png',
        title: 'A Clockwork Orange',
        author: 'Anthony Burgess',
        description: 'A dystopian classic',
      ),
      Book(
        imageUrl: 'assets/images/the_big_deal.png',
        title: 'The Big Deal',
        author: 'Hisham Al Gurg',
        description: '6 Steps Formula to kill your low sales stress',
      ),
      Book(
        imageUrl: 'assets/images/memory.png',
        title: 'Memory',
        author: 'Angelina Aludo',
        description: 'In purgatory, he has to piece together his jumbled memories',
      ),
      Book(
        imageUrl: 'assets/images/james_and_the_giant_peach.png',
        title: 'James and the Giant Peach',
        author: 'Roald Dahl',
        description: 'A classic by Roald Dahl',
      ),
    ];
    _allBooks.addAll(books);
    emit(BookListLoaded(books: _allBooks, sortByTitle: false));
  }

  void sortByAuthor() {
    emit(BookLoading());
    final sorted = [..._allBooks]..sort((a, b) => a.author.compareTo(b.author));
    emit(BookListLoaded(books: sorted, sortByTitle: false));
  }

  void sortByTitle() {
    emit(BookLoading());
    final sorted = [..._allBooks]..sort((a, b) => a.title.compareTo(b.title));
    emit(BookListLoaded(books: sorted, sortByTitle: true));
  }

  void showDetail(Book book) {
    emit(BookDetailLoaded(book));
  }

  void backToList() {
    emit(BookListLoaded(books: _allBooks, sortByTitle: false));
  }
}
