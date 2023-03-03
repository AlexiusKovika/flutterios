import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_book/blocs/user_bloc/user_bloc_states.dart';
import 'package:my_book/ui/screens/class_choise_screen/widgets/classes_part/widgets/class_card.dart';

import '../../../../../blocs/user_bloc/user_bloc.dart';
import '../../../../../blocs/user_bloc/user_bloc_events.dart';
import '../../../../../helper_entities/colors.dart';

class ClassesPart extends StatelessWidget {
  const ClassesPart({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    return SizedBox(
      child: Center(
        child: BlocBuilder<UserBloc, UserBlocState>(
          builder: (context, state) {
            if (state is UserBlocDataLoadedState ||
                state is UserBlocIsNotAuthState) {
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 2),
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 2,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return ClassCard(index: index);
                },
              );
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
    );
  }
}
