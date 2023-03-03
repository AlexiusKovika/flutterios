import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book/blocs/book_bloc/book_bloc.dart';
import 'package:my_book/blocs/book_bloc/book_bloc_events.dart';
import 'package:my_book/blocs/book_bloc/book_bloc_states.dart';
import 'package:my_book/blocs/user_bloc/user_bloc.dart';
import 'package:my_book/blocs/user_bloc/user_bloc_events.dart';
import 'package:my_book/helper_entities/colors.dart';
import 'package:flutter/cupertino.dart' as cupertino;

class SaveButton extends StatelessWidget {
  final int index;
  const SaveButton({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final bookBloc = BlocProvider.of<BookBloc>(context);
    final userBloc = BlocProvider.of<UserBloc>(context);

    return BlocBuilder<BookBloc, BookBlocState>(
      builder: (context, state) {
        bool isContains = userBloc.booksIds?.contains(
                (bookBloc.state as BookBlocDataLoadedState).data[index].id) ??
            false;
        return GestureDetector(
          onTap: () {
            if (!isContains) {
              final data = {
                'backpackID': userBloc.userDetails!.backpackId,
                'bookID':
                    (bookBloc.state as BookBlocDataLoadedState).data[index].id,
                'userID': userBloc.userDetails!.userId,
              };
              userBloc.add(UserBlocAddBookToBackpackEvent(data: data));
            } else {
              final data = {
                'backpackID': userBloc.userDetails!.backpackId,
                'bookID':
                    (bookBloc.state as BookBlocDataLoadedState).data[index].id,
              };
              userBloc.add(UserBlocRemoveBookFromBackpackEvent(
                  data: data, index: index));
            }
            bookBloc.add(BookBlocReloadEvent());
          },
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 150),
            child: isContains
                ? Icon(
                    key: UniqueKey(),
                    Platform.isAndroid
                        ? Icons.bookmark
                        : cupertino.CupertinoIcons.bookmark_fill,
                    color: AppElementColors.clickedBlue,
                    size: 25,
                  )
                : Icon(
                    key: UniqueKey(),
                    Platform.isAndroid
                        ? Icons.bookmark_outline
                        : cupertino.CupertinoIcons.bookmark,
                    size: 25,
                  ),
          ),
        );
      },
    );
  }
}
