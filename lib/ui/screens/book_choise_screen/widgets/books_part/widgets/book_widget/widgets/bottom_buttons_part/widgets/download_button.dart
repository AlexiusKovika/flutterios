import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_book/blocs/book_bloc/book_bloc_events.dart';
import 'package:my_book/blocs/book_bloc/book_bloc_states.dart';
import 'package:my_book/blocs/user_bloc/user_bloc.dart';
import 'package:flutter/cupertino.dart' as cupertino;

import '../../../../../../../../../../blocs/book_bloc/book_bloc.dart';
import '../../../../../../../../../../helper_entities/colors.dart';

class DownloadButton extends StatefulWidget {
  final int index;
  const DownloadButton({super.key, required this.index});

  @override
  State<DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookBloc, BookBlocState>(
      builder: (context, state) {
        final bookBloc = BlocProvider.of<BookBloc>(context);
        final userBloc = BlocProvider.of<UserBloc>(context);

        return GestureDetector(
          onTap: () {
            bookBloc.add(
              BookBlocDownloadBookEvent(
                index: widget.index,
                context: context,
                globalContext: userBloc.mainContext,
              ),
            );
          },
          child: bookBloc.downloadingBooks.contains(
                  (state as BookBlocDataLoadedState).data[widget.index].id)
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
