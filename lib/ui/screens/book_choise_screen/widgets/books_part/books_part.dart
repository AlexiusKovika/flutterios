import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_book/blocs/book_bloc/book_bloc.dart';
import 'package:my_book/blocs/book_bloc/book_bloc_events.dart';
import 'package:my_book/ui/screens/book_choise_screen/widgets/books_part/widgets/book_widget/book_widget.dart';

import '../../../../../blocs/book_bloc/book_bloc_states.dart';
import '../../../../../helper_entities/colors.dart';
import '../../../../situational_screens/folder_is_empty_screen/folder_is_empty_screen.dart';

class BooksPart extends StatelessWidget {
  final int userClass;
  const BooksPart({super.key, required this.userClass});

  @override
  Widget build(BuildContext context) {
    final bookBloc = BlocProvider.of<BookBloc>(context);

    return BlocBuilder<BookBloc, BookBlocState>(
      builder: (BuildContext context, state) {
        if (state is BookBlocDataLoadedState) {
          if (state.data.isNotEmpty) {
            return GridView.builder(
              // shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 2,
                childAspectRatio: 1 / 1.25,
              ),
              itemCount: state.data.length,
              // addAutomaticKeepAlives: false,
              itemBuilder: (context, index) {
                return BookWidget(index: index);
              },
            );
          } else {
            return const FolderIsEmptyScreen();
          }
        } else {
          bookBloc.add(
            BookBlocDataLoadingEvent(userClass: userClass),
          );
          return Center(
            child: LoadingAnimationWidget.staggeredDotsWave(
              color: AppElementColors.clickedBlue,
              size: 50,
            ),
          );
        }
      },
    );
  }
}
