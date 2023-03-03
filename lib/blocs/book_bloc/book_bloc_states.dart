import '../../entities/search_book.dart';

abstract class BookBlocState {}

class BookBlocInitState extends BookBlocState {}

class BookBlocDataLoadedState extends BookBlocState {
  final List<SearchBook> data;

  BookBlocDataLoadedState({required this.data});
}

class BookBlocDataIsEmptyState extends BookBlocState {}
