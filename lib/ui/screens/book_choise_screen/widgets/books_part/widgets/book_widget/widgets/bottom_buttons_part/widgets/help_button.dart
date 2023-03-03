import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart' as cupertino;

import '../../../../../../../../../../blocs/book_bloc/book_bloc.dart';
import '../../../../../../../../../../blocs/book_bloc/book_bloc_states.dart';
import '../../../../../../../../../../helper_entities/colors.dart';

class HelpButton extends StatelessWidget {
  final int index;
  const HelpButton({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final bookBlocState =
        BlocProvider.of<BookBloc>(context).state as BookBlocDataLoadedState;
    return GestureDetector(
      onTap: () {
        final book = bookBlocState.data[index];
        showDialog(
          context: context,
          builder: (BuildContext context) {
            print(bookBlocState.data[index].id);
            return AlertDialog(
              title: Text(book.name ?? 'null'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Автор: ${book.autor}'),
                  Text(
                    'Категорія: ${book.categoryName}',
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Закрити',
                    style: TextStyle(
                      color: AppElementColors.textBlue,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Icon(
        Platform.isAndroid
            ? Icons.help_outline
            : cupertino.CupertinoIcons.question_circle,
        size: 25,
      ),
    );
  }
}
