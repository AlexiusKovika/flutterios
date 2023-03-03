import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_book/entities/backpack_book.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:my_book/helper_entities/colors.dart';

class HelpButton extends StatelessWidget {
  final int index;
  final List<BackpackBook> backpack;
  const HelpButton({super.key, required this.index, required this.backpack});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final book = backpack[index];
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              // backgroundColor: Colors.white,
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
