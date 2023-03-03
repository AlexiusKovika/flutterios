import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book/ui/screens/book_choise_screen/widgets/books_part/widgets/book_widget/widgets/background_image.dart';
import 'package:my_book/ui/screens/book_choise_screen/widgets/books_part/widgets/book_widget/widgets/bottom_buttons_part/bottom_buttons_part.dart';
import 'package:pdftron_flutter/pdftron_flutter.dart';

import '../../../../../../../blocs/book_bloc/book_bloc.dart';
import '../../../../../../../blocs/book_bloc/book_bloc_states.dart';
import '../../../../../../../helper_entities/colors.dart';
import '../../../../../../router/main_router.dart';

class BookWidget extends StatefulWidget {
  final int index;
  const BookWidget({super.key, required this.index});

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
    // config.downloadDialogEnabled = true;
  }

  @override
  Widget build(BuildContext context) {
    final bookBlocState =
        BlocProvider.of<BookBloc>(context).state as BookBlocDataLoadedState;
    return GestureDetector(
      onTap: () {
        wasClicked = !wasClicked;
        setState(() {});

        Future.delayed(const Duration(milliseconds: 50)).whenComplete(() async {
          MainRouter.animateToBookPageScreen(
              context, bookBlocState.data[widget.index].bookUrl!);
          // await PdftronFlutter.openDocument(
          //   bookBlocState.data[widget.index].bookUrl!,
          //   config: config,
          // );
          print(
              '------------------------------${bookBlocState.data[widget.index].id}------------------------------');
          setState(() {});
          wasClicked = !wasClicked;
        });
      },
      child: Card(
        surfaceTintColor: Colors.white,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            width: 1,
            color:
                wasClicked ? AppElementColors.clickedBlue : Colors.transparent,
          ),
        ),
        elevation: wasClicked ? 0 : 7,
        child: Stack(
          fit: StackFit.expand,
          children: [
            BackGroundImage(
              index: widget.index,
            ),
            BottomButtonsPart(
              index: widget.index,
            ),
          ],
        ),
      ),
    );
  }
}
