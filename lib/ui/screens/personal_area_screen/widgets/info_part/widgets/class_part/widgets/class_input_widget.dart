import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:my_book/blocs/registration_bloc/registration_bloc_states.dart';
import 'package:my_book/blocs/user_bloc/user_bloc_events.dart';

import '../../../../../../../../blocs/user_bloc/user_bloc.dart';
import '../../../../../../../../blocs/user_bloc/user_bloc_states.dart';
import '../../../../../../../../helper_entities/colors.dart';

class ClassInputWidget extends StatelessWidget {
  const ClassInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    return BlocBuilder<UserBloc, UserBlocState>(
      builder: (context, state) {
        if (state is RegistrationBlocInitState) {
          userBloc.add(UserBlocRewriteEvent());
          return Center(
            child: LoadingAnimationWidget.staggeredDotsWave(
              color: AppElementColors.mainOrange,
              size: 30,
            ),
          );
        } else {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: DropdownButton<String>(
              value: userBloc.pickedClass != '12'
                  ? userBloc.pickedClass
                  : 'Позакласне читання',
              icon: const Icon(Icons.arrow_drop_down),
              elevation: 16,
              isExpanded: true,
              style: const TextStyle(
                color: AppTextColors.secondaryGrey,
                fontSize: 18,
                fontFamily: 'Dniprocity',
                fontWeight: FontWeight.w500,
              ),
              underline: const SizedBox.shrink(),
              onChanged: (String? value) {
                userBloc.add(UserBlocClassChangeEvent(
                    userClass: value! != 'Позакласне читання' ? value : '12'));
                userBloc.add(UserBlocUpdateUserInfoEvent());
              },
              items: List.generate(13, (index) {
                if (index == 0) {
                  return 'Клас не обрано';
                } else if (index == 12) {
                  return 'Позакласне читання';
                } else {
                  return index.toString();
                }
              }).map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                  ),
                );
              }).toList(),
            ),
          );
        }
      },
    );
  }
}
