import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart' as cupertino;

import '../../../../../blocs/user_bloc/user_bloc.dart';
import '../../../../../blocs/user_bloc/user_bloc_events.dart';
import '../../../../../helper_entities/colors.dart';
import '../../../../../helper_entities/radio.dart';

class UserBackpackChoiseRadio extends StatelessWidget {
  const UserBackpackChoiseRadio({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    return IconButton(
      onPressed: () {
        userBloc
            .add(UserBlocChangeCharacterEvent(character: RadioCharacter.user));
      },
      icon: Icon(
        Platform.isAndroid ? Icons.person : cupertino.CupertinoIcons.person,
        color: userBloc.character == RadioCharacter.user
            ? AppElementColors.clickedBlue
            : AppElementColors.disabledGrey,
      ),
    );
  }
}
