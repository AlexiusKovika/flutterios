import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book/helper_entities/colors.dart';

import '../../../../../../blocs/user_bloc/user_bloc.dart';
import '../../../../../router/main_router.dart';

class ClassCard extends StatefulWidget {
  final int index;
  const ClassCard({super.key, required this.index});

  @override
  State<ClassCard> createState() => _ClassCardState();
}

class _ClassCardState extends State<ClassCard> {
  bool wasClicked = false;
  @override
  Widget build(BuildContext context) {
    final value =
        widget.index != 11 ? '${widget.index + 1} клас' : 'Позакласне навчання';
    final userBloc = BlocProvider.of<UserBloc>(context);
    return GestureDetector(
      onTap: () {
        wasClicked = !wasClicked;
        setState(() {});
        Future.delayed(const Duration(milliseconds: 100)).whenComplete(() {
          MainRouter.animateToBookChoiseScreen(
            context,
            userBloc.userDetails,
            widget.index + 1,
            userBloc.mainContext!,
          );
          setState(() {});
          wasClicked = !wasClicked;
        });
      },
      child: Card(
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            width: 1,
            color:
                wasClicked ? AppElementColors.clickedBlue : Colors.transparent,
          ),
        ),
        elevation: wasClicked ? 0 : 7,
        child: Center(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: wasClicked
                  ? AppTextColors.clickedBlue
                  : AppTextColors.defaultColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
