import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_book/blocs/user_bloc/user_bloc.dart';
import 'package:my_book/blocs/user_bloc/user_bloc_states.dart';
import 'package:my_book/helper_entities/radio.dart';

import '../../../../../../../blocs/user_bloc/user_bloc_events.dart';
import '../../../../../../../helper_entities/colors.dart';

class DownloadButton extends StatelessWidget {
  final index;
  const DownloadButton({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    bool isDownloading = false;
    return BlocBuilder<UserBloc, UserBlocState>(
      builder: (context, state) {
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
        return GestureDetector(
          onTap: () {
            userBloc.add(
              UserBlocDownloadBookEvent(
                index: index,
                globalContext: userBloc.mainContext,
              ),
            );
          },
          child: isDownloading
              ? LoadingAnimationWidget.staggeredDotsWave(
                  color: AppElementColors.clickedBlue,
                  size: 25,
                )
              : Icon(
                  Platform.isAndroid
                      ? Icons.file_download_outlined
                      : cupertino.CupertinoIcons.arrow_down_to_line,
                  size: 25,
                ),
        );
      },
    );
  }
}
