import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book/blocs/user_bloc/user_bloc_events.dart';
import 'package:my_book/blocs/user_bloc/user_bloc_states.dart';
import 'package:my_book/entities/school.dart';

import '../../../../../../../../blocs/user_bloc/user_bloc.dart';
import '../../../../../../../../helper_entities/colors.dart';

class SchoolInputWidget extends StatelessWidget {
  const SchoolInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    return BlocBuilder<UserBloc, UserBlocState>(builder: (context, state) {
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
          value: userBloc.pickedCommonSchool,
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
            userBloc.add(UserBlocCommonSchoolChangeEvent(school: value!));
            userBloc.add(UserBlocUpdateUserInfoEvent());
          },
          items: userBloc.commonSchools!
              .map<DropdownMenuItem<String>>((School value) {
            return DropdownMenuItem<String>(
              value: value.name,
              child: Text(
                value.name.toString(),
              ),
            );
          }).toList(),
        ),
      );
    });
  }
}
