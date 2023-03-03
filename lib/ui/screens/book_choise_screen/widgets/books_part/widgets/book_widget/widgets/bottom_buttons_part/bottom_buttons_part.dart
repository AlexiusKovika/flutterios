import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book/ui/screens/book_choise_screen/widgets/books_part/widgets/book_widget/widgets/bottom_buttons_part/widgets/download_button.dart';
import 'package:my_book/ui/screens/book_choise_screen/widgets/books_part/widgets/book_widget/widgets/bottom_buttons_part/widgets/help_button.dart';
import 'package:my_book/ui/screens/book_choise_screen/widgets/books_part/widgets/book_widget/widgets/bottom_buttons_part/widgets/save_button.dart';

import '../../../../../../../../../blocs/user_bloc/user_bloc.dart';

class BottomButtonsPart extends StatelessWidget {
  final int index;
  const BottomButtonsPart({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Colors.white.withOpacity(0.9),
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: userBloc.userDetails?.role != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DownloadButton(
                    index: index,
                  ),
                  SaveButton(
                    index: index,
                  ),
                  HelpButton(
                    index: index,
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DownloadButton(
                    index: index,
                  ),
                  HelpButton(
                    index: index,
                  ),
                ],
              ),
      ),
    );
  }
}
