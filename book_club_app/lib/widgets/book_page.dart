import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/book_bloc.dart';
import '../bloc/book_event.dart';
import '../bloc/book_state.dart';
import '../styles.dart';
// 引入BookImage以在水平列表中使用
import 'book_image.dart';
import 'book_detail_page.dart';

class BookPage extends StatelessWidget {
  const BookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookBloc, BookState>(
      builder: (context, state) {
        if (state is BookLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state is BookListLoaded) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {},
              ),
              centerTitle: true,
              title: const Text('Book Club Home'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.person),
                  onPressed: () {},
                ),
              ],
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text('Sort by'),
                      SizedBox(width: filterChipGap),
                      FilterChip(
                        label: const Text('Author'),
                        selected: !state.sortByTitle,
                        onSelected: (_) => context.read<BookBloc>().add(SortByAuthor()),
                        labelStyle: !state.sortByTitle ? filterChipSelectedTextStyle : filterChipTextStyle,
                        selectedColor: filterChipSelectedBackgroundColor,
                      ),
                      SizedBox(width: filterChipGap),
                      FilterChip(
                        label: const Text('Title'),
                        selected: state.sortByTitle,
                        onSelected: (_) => context.read<BookBloc>().add(SortByTitle()),
                        labelStyle: state.sortByTitle ? filterChipSelectedTextStyle : filterChipTextStyle,
                        selectedColor: filterChipSelectedBackgroundColor,
                      ),
                    ],
                  ),
                ),
                // Books 标题
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  child: Text(
                    'Books',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                // 水平滚动封面列表
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: state.books.length,
                    itemBuilder: (context, index) {
                      final book = state.books[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: InkWell(
                          onTap: () => context.read<BookBloc>().add(ShowDetail(book)),
                          child: BookImage(imageUrl: book.imageUrl),
                        ),
                      );
                    },
                  ),
                ),
              ],
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
