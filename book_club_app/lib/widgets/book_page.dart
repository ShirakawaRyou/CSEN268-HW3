import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/book_cubit.dart';
import '../cubit/book_state.dart';
import '../models/book.dart';
import 'book_info.dart';
import 'book_detail_page.dart';

class BookPage extends StatelessWidget {
  const BookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookCubit, BookState>(
      builder: (context, state) {
        if (state is BookLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state is BookListLoaded) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Book Club'),
              actions: [
                TextButton(
                  onPressed: () => context.read<BookCubit>().sortByAuthor(),
                  child: Text(
                    'Author',
                    style: TextStyle(
                      color: state.sortByTitle ? Colors.white54 : Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => context.read<BookCubit>().sortByTitle(),
                  child: Text(
                    'Title',
                    style: TextStyle(
                      color: state.sortByTitle ? Colors.white : Colors.white54,
                    ),
                  ),
                ),
              ],
            ),
            body: ListView.separated(
              itemCount: state.books.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final book = state.books[index];
                return InkWell(
                  onTap: () => context.read<BookCubit>().showDetail(book),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BookInfo(book: book),
                  ),
                );
              },
            ),
          );
        } else if (state is BookDetailLoaded) {
          return BookDetailPage(book: state.selectedBook);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
