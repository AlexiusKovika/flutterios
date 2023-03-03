import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book/helper_entities/colors.dart';

import '../../../../../../../../blocs/user_bloc/user_bloc.dart';
import '../../../../../../../../blocs/user_bloc/user_bloc_events.dart';
import '../../../../../../../../blocs/user_bloc/user_bloc_states.dart';

class MailInputWidget extends StatefulWidget {
  const MailInputWidget({super.key});

  @override
  State<MailInputWidget> createState() => _MailInputWidgetState();
}

class _MailInputWidgetState extends State<MailInputWidget> {
  bool isChanged = false;

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    return BlocBuilder<UserBloc, UserBlocState>(
      builder: (context, state) {
        if (state is UserBlocErrorState && state.mailErrorMessage != null) {
          return TextField(
            controller: userBloc.mailController,
            onChanged: (value) {
              if (value != userBloc.mailResponse) {
                isChanged = true;
                setState(() {});
              } else {
                isChanged = false;
                setState(() {});
              }
            },
            style: TextStyle(color: AppElementColors.errorRed),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 20,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppElementColors.errorRed,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppElementColors.errorRed,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              suffix: AnimatedSwitcher(
                duration: Duration(milliseconds: 150),
                child: isChanged
                    ? Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1000),
                            color: AppElementColors.clickedBlue),
                        key: UniqueKey(),
                        child: GestureDetector(
                          onTap: () {
                            isChanged = false;
                            userBloc.add(UserBlocUpdateUserInfoEvent());
                          },
                          child: Icon(
                            Icons.check,
                            size: 19,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000),
                          color: Colors.transparent,
                        ),
                        key: UniqueKey(),
                        child: Icon(
                          Icons.check,
                          size: 19,
                          color: Colors.transparent,
                        ),
                      ),
              ),
            ),
          );
        } else {
          return TextField(
            controller: userBloc.mailController,
            onChanged: (value) {
              if (value != userBloc.mailResponse) {
                isChanged = true;
                setState(() {});
              } else {
                isChanged = false;
                setState(() {});
              }
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 20,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              suffix: AnimatedSwitcher(
                duration: Duration(milliseconds: 150),
                child: isChanged
                    ? Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1000),
                            color: AppElementColors.clickedBlue),
                        key: UniqueKey(),
                        child: GestureDetector(
                          onTap: () {
                            isChanged = false;
                            userBloc.add(UserBlocUpdateUserInfoEvent());
                          },
                          child: Icon(
                            Icons.check,
                            size: 19,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000),
                          color: Colors.transparent,
                        ),
                        key: UniqueKey(),
                        child: Icon(
                          Icons.check,
                          size: 19,
                          color: Colors.transparent,
                        ),
                      ),
              ),
            ),
          );
        }
      },
    );
  }
}
