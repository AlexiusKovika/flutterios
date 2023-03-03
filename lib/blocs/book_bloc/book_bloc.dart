import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book/blocs/book_bloc/book_bloc_events.dart';
import 'package:my_book/blocs/book_bloc/book_bloc_states.dart';
import 'package:my_book/domen/api_client/api_client.dart';

import '../../domen/repository/main_repository.dart';
import '../../entities/search_book.dart';
import '../../helper_entities/images.dart';

class BookBloc extends Bloc<BookBlocEvent, BookBlocState> {
  final List<SearchBook> data = [];
  final List<String> filterParameters = ['Фільтр відсутній'];
  final downloadingBooks = [];
  final _repo = MainRepository();
  int? tempClass;
  String? mainFilter;

  BookBloc() : super(BookBlocInitState()) {
    on<BookBlocDataLoadingEvent>(_dataLoading);
    on<BookBlocDataSortEvent>(_sort);
    on<BookBlocReloadEvent>(_reload);
    on<BookBlocDownloadBookEvent>(_download);
  }

  void _dataLoading(event, emit) async {
    try {
      tempClass = event.userClass;
      if (event.userClass != 12) {
        final response = await ApiClient.getBooks(event.userClass as int);
        for (var element in response) {
          if (!filterParameters.contains(element.categoryName)) {
            filterParameters.add(element.categoryName!);
          }
        }
        mainFilter = filterParameters[0];
        data.addAll(response);
        emit(BookBlocDataLoadedState(data: data));
      } else {
        final response = await ApiClient.getExtracurricalBooks(event.userClass);
        for (var element in response) {
          if (!filterParameters.contains(element.categoryName)) {
            filterParameters.add(element.categoryName!);
          }
        }
        mainFilter = filterParameters[0];
        data.addAll(response);
        emit(BookBlocDataLoadedState(data: data));
      }
    } catch (e) {
      print(e);
    }
  }

  void _sort(event, emit) {
    final List<SearchBook> sortedBooks;

    mainFilter = event.filter;

    if (mainFilter == 'Фільтр відсутній') {
      sortedBooks = data;
    } else {
      sortedBooks = data
          .where((element) => element.categoryName == event.filter)
          .toList();
    }

    if (sortedBooks.isNotEmpty) {
      emit(BookBlocDataLoadedState(data: sortedBooks));
    } else {
      emit(BookBlocDataIsEmptyState());
    }
  }

  void _reload(event, emit) async {
    add(BookBlocDataSortEvent(filter: mainFilter!));
  }

  void _download(event, emit) async {
    downloadingBooks.add(data[event.index].id);

    _reload(event, emit);

    final downloadPath = await _repo.getDownloadDirectory();
    final response = await ApiClient.downloadBook(data[event.index].bookUrl!);

    await MainRepository().saveDownloadedBook(
        downloadPath!, response, data[event.index].name!.replaceAll(r' ', '_'));

    if (event.context.mounted) {
      downloadingBooks.remove(data[event.index].id);
      _reload(event, emit);
      bool isShowed = ModalRoute.of(event.context)?.isCurrent ?? false;
      showModalBottomSheet(
        context: event.context,
        backgroundColor: Colors.white.withOpacity(0.95),
        builder: (context) {
          if (!isShowed) {
            Navigator.of(context).pop();
          }
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AssetImages.bookDownloadSuccess,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Підручник успішно завантажено',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    // color: AppElementColors.lime,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        },
      );
      Future.delayed(Duration(seconds: 3)).whenComplete(() {
        isShowed = ModalRoute.of(event.context)?.isCurrent ?? false;
        if (!isShowed) {
          Navigator.of(event.context).pop();
        }
      });
    } else if (event.globalContext.mounted) {
      bool isShowed = ModalRoute.of(event.globalContext)?.isCurrent ?? false;
      showModalBottomSheet(
        context: event.globalContext,
        backgroundColor: Colors.white.withOpacity(0.95),
        builder: (context) {
          if (!isShowed) {
            Navigator.of(context).pop();
          }
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AssetImages.bookDownloadSuccess,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Підручник успішно завантажено',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    // color: AppElementColors.lime,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        },
      );
      Future.delayed(Duration(seconds: 3)).whenComplete(() {
        isShowed = ModalRoute.of(event.globalContext)?.isCurrent ?? false;
        if (!isShowed) {
          Navigator.of(event.globalContext).pop();
        }
      });
    }
  }
}
