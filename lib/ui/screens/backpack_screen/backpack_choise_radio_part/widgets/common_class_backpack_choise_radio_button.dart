import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../blocs/user_bloc/user_bloc.dart';
import '../../../../../blocs/user_bloc/user_bloc_events.dart';
import '../../../../../helper_entities/colors.dart';
import '../../../../../helper_entities/radio.dart';

class CommonClassBackpackChoisRadioButton extends StatelessWidget {
  const CommonClassBackpackChoisRadioButton({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    return IconButton(
      onPressed: () {
        userBloc.add(UserBlocChangeCharacterEvent(
            character: RadioCharacter.commonUserClass));
      },
      icon: Icon(
        Icons.school,
        color: userBloc.character == RadioCharacter.commonUserClass
            ? AppElementColors.clickedBlue
            : AppElementColors.disabledGrey,
      ),
    );
  }
}
