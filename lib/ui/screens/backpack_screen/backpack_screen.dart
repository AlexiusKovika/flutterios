import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_book/blocs/user_bloc/user_bloc.dart';
import 'package:my_book/blocs/user_bloc/user_bloc_states.dart';
import 'package:my_book/helper_entities/colors.dart';
import 'package:my_book/ui/screens/backpack_screen/books_part/books_part.dart';

import '../../../blocs/user_bloc/user_bloc_events.dart';
import '../../screen_independent_widgets/logos_with_margin.dart';
import '../../situational_screens/user_is_unath_screen/user_is_unauth_screen.dart';
import 'backpack_choise_radio_part/backpack_choise_radio_part.dart';

class BackpackScreen extends StatelessWidget {
  const BackpackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    if (userBloc.state is! UserBlocIsNotAuthState) {
      userBloc.add(UserBlocBackpackReloadEvent());
    }
    return Container(
      padding: const EdgeInsets.all(16),
      child: BlocBuilder<UserBloc, UserBlocState>(
        builder: (context, state) {
          if (state is UserBlocDataLoadedState) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LogoWidgetWithMargin(
                  isReturnable: false,
                ),
                Expanded(
                  child: BooksPart(),
                ),
                BackpackChoiseRadioPart(),
              ],
            );
          } else if (state is UserBlocIsNotAuthState) {
            return const UserIsUnauthScreen();
          } else {
            return Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: AppElementColors.clickedBlue,
                size: 50,
              ),
            );
          }
        },
      ),
    );
  }
}
