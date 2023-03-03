import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_book/blocs/user_bloc/user_bloc.dart';
import 'package:my_book/blocs/user_bloc/user_bloc_events.dart';
import 'package:my_book/blocs/user_bloc/user_bloc_states.dart';
import 'package:my_book/helper_entities/colors.dart';
import 'package:my_book/ui/screens/personal_area_screen/widgets/avatar_part/avatar_part.dart';
import 'package:my_book/ui/screens/personal_area_screen/widgets/buttons_part/buttons_part.dart';
import 'package:my_book/ui/screens/personal_area_screen/widgets/info_part/info_part.dart';

import '../../screen_independent_widgets/logos_with_margin.dart';
import '../../situational_screens/user_is_unath_screen/user_is_unauth_screen.dart';

class PersonalAreaScreen extends StatelessWidget {
  const PersonalAreaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      backgroundColor: AppElementColors.backgroundGrey,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            child: BlocBuilder<UserBloc, UserBlocState>(
              builder: (context, state) {
                if (state is UserBlocDataLoadedState ||
                    state is UserBlocErrorState) {
                  return LayoutBuilder(
                    builder: (context, constraints) => SingleChildScrollView(
                      physics: Platform.isAndroid
                          ? const ClampingScrollPhysics()
                          : const BouncingScrollPhysics(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: IntrinsicHeight(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              LogoWidgetWithMargin(
                                isReturnable: false,
                              ),
                              AvatarPart(),
                              Expanded(
                                // flex: 2,
                                child: StudentInfoPart(),
                              ),
                              ButtonsPart(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                } else if (state is UserBlocIsNotAuthState) {
                  return const UserIsUnauthScreen();
                } else {
                  if (userBloc.user == null) {
                    userBloc.add(UserBlocRewriteEvent());
                  } else {
                    userBloc.add(UserBlocGetFullInfoEvent());
                  }
                  return Center(
                    child: LoadingAnimationWidget.staggeredDotsWave(
                      color: AppElementColors.clickedBlue,
                      size: 50,
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
