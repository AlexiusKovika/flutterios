import 'package:flutter/cupertino.dart';

abstract class BookBlocEvent {}

class BookBlocDataLoadingEvent extends BookBlocEvent {
  final int userClass;

  BookBlocDataLoadingEvent({required this.userClass});
}

class BookBlocDataSortEvent extends BookBlocEvent {
  final String filter;

  BookBlocDataSortEvent({required this.filter});
}

class BookBlocReloadEvent extends BookBlocEvent {}

class BookBlocDownloadBookEvent extends BookBlocEvent {
  final int index;
  final BuildContext context;
  final BuildContext? globalContext;

  BookBlocDownloadBookEvent({
    required this.globalContext,
    required this.context,
    required this.index,
  });
}
