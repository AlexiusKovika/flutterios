import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart' as cupertino;

import '../../../../../../../blocs/user_bloc/user_bloc.dart';
import '../../../../../../../blocs/user_bloc/user_bloc_events.dart';
import '../../../../../../../entities/backpack_book.dart';
import '../../../../../../../helper_entities/colors.dart';
import '../../../../../../../helper_entities/radio.dart';

class SaveButton extends StatelessWidget {
  final int index;
  final List<BackpackBook> backpack;
  final GlobalKey<AnimatedGridState>? gridKey;
  final Animation<double>? animation;
  final bool remove;
  const SaveButton({
    super.key,
    required this.index,
    required this.backpack,
    required this.gridKey,
    required this.animation,
    required this.remove,
  });

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    bool isDownloading = false;
    if (userBloc.character == RadioCharacter.user) {
      isDownloading = userBloc.downloadingBooks
          .contains(userBloc.userBackpack![index].bookID);
    } else if (userBloc.character == RadioCharacter.commonUserClass) {
      isDownloading = userBloc.downloadingBooks
          .contains(userBloc.classBackpack![index].bookID);
    } else {
      isDownloading = userBloc.downloadingBooks
          .contains(userBloc.musicClassBackpack?[index].bookID);
    }
    return isDownloading
        ? Icon(
            Platform.isAndroid
                ? Icons.bookmark
                : cupertino.CupertinoIcons.bookmark_fill,
            color: AppElementColors.disabledGrey,
            size: 25,
          )
        : GestureDetector(
            onTap: () {
              // print(index);
              final data = {
                'backpackID': userBloc.userDetails!.backpackId,
                'bookID': userBloc.userBackpack![index].id,
              };
              userBloc.add(UserBlocRemoveBookFromBackpackEvent(
                  data: data, gridKey: gridKey, index: index));
            },
            child: Icon(
              Platform.isAndroid
                  ? Icons.bookmark
                  : cupertino.CupertinoIcons.bookmark_fill,
              color: AppElementColors.clickedBlue,
              size: 25,
            ),
          );
  }
}
