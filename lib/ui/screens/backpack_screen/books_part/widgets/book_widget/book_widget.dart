import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book/entities/backpack_book.dart';
import 'package:my_book/helper_entities/images.dart';
import 'package:my_book/helper_entities/radio.dart';
import 'package:my_book/ui/screens/backpack_screen/books_part/widgets/book_widget/widgets/download_button.dart';
import 'package:my_book/ui/screens/backpack_screen/books_part/widgets/book_widget/widgets/help_button.dart';
import 'package:my_book/ui/screens/backpack_screen/books_part/widgets/book_widget/widgets/save_button.dart';
import 'package:pdftron_flutter/pdftron_flutter.dart';

import '../../../../../../../helper_entities/colors.dart';
import '../../../../../../blocs/user_bloc/user_bloc.dart';
import '../../../../../router/main_router.dart';

class BookWidget extends StatefulWidget {
  final int index;
  final List<BackpackBook> backpack;
  final GlobalKey<AnimatedGridState>? gridKey;
  final Animation<double>? animation;
  final bool remove = false;
  const BookWidget({
    super.key,
    required this.index,
    required this.backpack,
    this.gridKey,
    this.animation,
  });

  @override
  State<BookWidget> createState() => _BookWidgetState();
}

class _BookWidgetState extends State<BookWidget> {
  bool wasClicked = false;
  var config = Config();

  @override
  void initState() {
    super.initState();
    config.multiTabEnabled = true;
    config.customHeaders = {'headerName': 'headerValue'};
    config.downloadDialogEnabled = false;
    // config.downloadDialogEnabled = true;
  }

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    return GestureDetector(
      onTap: () {
        wasClicked = !wasClicked;
        setState(() {});
        Future.delayed(const Duration(milliseconds: 50)).whenComplete(
          () async {
            MainRouter.animateToBookPageScreen(
                context, widget.backpack[widget.index].bookUrl!);
            print(widget.backpack[widget.index].id);
            setState(() {});
            wasClicked = !wasClicked;
          },
        );
      },
      child: widget.animation != null
          ? FadeTransition(
              opacity: widget.animation!,
              child: Card(
                surfaceTintColor: Colors.white,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    width: 3,
                    color: wasClicked
                        ? AppElementColors.clickedBlue
                        : Colors.transparent,
                  ),
                ),
                elevation: wasClicked ? 0 : 7,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    FancyShimmerImage(
                      boxFit: BoxFit.cover,
                      imageUrl: widget.backpack[widget.index].coverUrl ??
                          AssetImages.loadingErrorImage,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: Colors.white.withOpacity(0.9),
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child:
                            userBloc.character != RadioCharacter.commonUserClass
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      DownloadButton(
                                        index: widget.index,
                                      ),
                                      SaveButton(
                                        index: widget.index,
                                        animation: widget.animation,
                                        backpack: widget.backpack,
                                        gridKey: widget.gridKey,
                                        remove: true,
                                      ),
                                      HelpButton(
                                        index: widget.index,
                                        backpack: widget.backpack,
                                      ),
                                    ],
                                  )
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      DownloadButton(
                                        index: widget.index,
                                      ),
                                      HelpButton(
                                        index: widget.index,
                                        backpack: widget.backpack,
                                      ),
                                    ],
                                  ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Card(
              surfaceTintColor: Colors.white,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  width: 3,
                  color: wasClicked
                      ? AppElementColors.clickedBlue
                      : Colors.transparent,
                ),
              ),
              elevation: wasClicked ? 0 : 7,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  FancyShimmerImage(
                    boxFit: BoxFit.cover,
                    imageUrl: widget.backpack[widget.index].coverUrl ??
                        AssetImages.loadingErrorImage,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.white.withOpacity(0.9),
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: userBloc.character !=
                                  RadioCharacter.commonUserClass &&
                              userBloc.character !=
                                  RadioCharacter.musicalUserClass
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                DownloadButton(
                                  index: widget.index,
                                ),
                                SaveButton(
                                  index: widget.index,
                                  animation: widget.animation,
                                  backpack: widget.backpack,
                                  gridKey: widget.gridKey,
                                  remove: true,
                                ),
                                HelpButton(
                                  index: widget.index,
                                  backpack: widget.backpack,
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                DownloadButton(
                                  index: widget.index,
                                ),
                                HelpButton(
                                  index: widget.index,
                                  backpack: widget.backpack,
                                ),
                              ],
                            ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
