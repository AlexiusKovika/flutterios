import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book/blocs/user_bloc/user_bloc_states.dart';
import 'package:my_book/ui/screens/backpack_screen/backpack_choise_radio_part/widgets/common_class_backpack_choise_radio_button.dart';
import 'package:my_book/ui/screens/backpack_screen/backpack_choise_radio_part/widgets/musical_class_backpack_choise_radio_button.dart';
import 'package:my_book/ui/screens/backpack_screen/backpack_choise_radio_part/widgets/user_backpack_radio_button.dart';

import '../../../../blocs/user_bloc/user_bloc.dart';

class BackpackChoiseRadioPart extends StatelessWidget {
  const BackpackChoiseRadioPart({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    return BlocBuilder<UserBloc, UserBlocState>(
      builder: (context, state) {
        if (userBloc.pickedMusicalSchool != userBloc.musicalSchools![0].name) {
          return Row(
            children: <Widget>[
              Expanded(
                child: UserBackpackChoiseRadio(),
              ),
              Expanded(
                child: CommonClassBackpackChoisRadioButton(),
              ),
              Expanded(
                child: MusicalClassBackpackChoisRadioButton(),
              ),
            ],
          );
        } else {
          return Row(
            children: <Widget>[
              Expanded(
                child: UserBackpackChoiseRadio(),
              ),
              Expanded(
                child: CommonClassBackpackChoisRadioButton(),
              ),
            ],
          );
        }
      },
    );
  }
}
