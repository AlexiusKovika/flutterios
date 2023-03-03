import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_book/ui/screens/backpack_screen/books_part/widgets/book_widget/book_widget.dart';

import '../../../../blocs/user_bloc/user_bloc.dart';
import '../../../../blocs/user_bloc/user_bloc_states.dart';
import '../../../../entities/backpack_book.dart';
import '../../../../helper_entities/colors.dart';
import '../../../../helper_entities/radio.dart';
import '../../../situational_screens/folder_is_empty_screen/folder_is_empty_screen.dart';

class BooksPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    final scrollController =
        ScrollController(initialScrollOffset: userBloc.offset ?? 0);
    scrollController.addListener(() {
      userBloc.offset = scrollController.offset;
    });
    return BlocBuilder<UserBloc, UserBlocState>(
      builder: (BuildContext context, state) {
        if (state is UserBlocDataLoadedState) {
          final List<BackpackBook>? backpack;
          if (userBloc.character == RadioCharacter.user) {
            backpack = userBloc.userBackpack!;
            if (backpack.isNotEmpty) {
              final GlobalKey<AnimatedGridState> gridKey =
                  GlobalKey<AnimatedGridState>();
              return AnimatedGrid(
                key: gridKey,
                initialItemCount: backpack.length,
                controller: scrollController,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 2,
                  childAspectRatio: 1 / 1.25,
                ),
                itemBuilder: (BuildContext context, int index,
                    Animation<double> animation) {
                  return BookWidget(
                    key: UniqueKey(),
                    gridKey: gridKey,
                    animation: animation,
                    index: index,
                    backpack: backpack!,
                  );
                },
              );
            } else {
              return FolderIsEmptyScreen();
            }
          } else if (userBloc.character == RadioCharacter.commonUserClass) {
            backpack = userBloc.classBackpack;
            if (backpack?.isNotEmpty ?? false) {
              return GridView.builder(
                itemCount: backpack!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 2,
                  childAspectRatio: 1 / 1.25,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return BookWidget(
                    key: UniqueKey(),
                    index: index,
                    backpack: backpack!,
                  );
                },
              );
            } else {
              return FolderIsEmptyScreen();
            }
          } else {
            backpack = userBloc.musicClassBackpack;
            if (backpack?.isNotEmpty ?? false) {
              return GridView.builder(
                itemCount: backpack!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 2,
                  childAspectRatio: 1 / 1.25,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return BookWidget(
                    key: UniqueKey(),
                    index: index,
                    backpack: backpack!,
                  );
                },
              );
            } else {
              return FolderIsEmptyScreen();
            }
          }
        } else {
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
