import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_book/blocs/user_bloc/user_bloc.dart';
import 'package:my_book/blocs/user_bloc/user_bloc_events.dart';
import 'package:my_book/blocs/user_bloc/user_bloc_states.dart';
import 'package:my_book/ui/screens/backpack_screen/backpack_screen.dart';
import 'package:my_book/ui/screens/class_choise_screen/class_choise_screen.dart';

import '../../../entities/user.dart';
import '../../../helper_entities/colors.dart';
import '../../screen_independent_widgets/bottom_navigation_bar/users_bottom_navigation_bar.dart';
import '../personal_area_screen/personal_area_screen.dart';

class MainActivityScreen extends StatelessWidget {
  final controller = PageController();
  final User? user;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  MainActivityScreen({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocProvider(
        create: (BuildContext context) =>
            UserBloc(mainContext: context, user: user),
        child: BlocBuilder<UserBloc, UserBlocState>(
          builder: (context, state) {
            final userBloc = BlocProvider.of<UserBloc>(context);
            if (state is UserBlocInitState) {
              if (user == null) {
                userBloc.add(UserBlocAuthWithInnerTokenEvent(context));
              } else {
                userBloc.add(UserBlocGetFullInfoEvent());
              }
              return Scaffold(
                body: Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                    color: AppElementColors.clickedBlue,
                    size: 50,
                  ),
                ),
              );
            } else {
              userBloc.scaffoldKey = _scaffoldKey;
              return Scaffold(
                key: _scaffoldKey,
                body: SafeArea(
                  child: PageView(
                    controller: controller,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      ClassChoiseScreen(),
                      BackpackScreen(),
                      PersonalAreaScreen(),
                    ],
                  ),
                ),
                bottomNavigationBar: UsersBottomNavigationBar(
                  controller: controller,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
