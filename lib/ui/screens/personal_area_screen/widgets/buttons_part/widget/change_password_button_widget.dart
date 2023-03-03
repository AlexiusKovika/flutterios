import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book/blocs/user_bloc/user_bloc.dart';
import 'package:my_book/ui/router/main_router.dart';

import '../../../../../../../../helper_entities/colors.dart';

class ChangePasswordButtonWidget extends StatelessWidget {
  const ChangePasswordButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    return SizedBox(
      // width: MediaQuery.of(context).size.width,
      child: TextButton(
        onPressed: () {
          MainRouter.animateToChangePasswordScreen(
              context, userBloc.userDetails!);
        },
        style: ButtonStyle(
          minimumSize: const MaterialStatePropertyAll(
            Size(100, 55),
          ),
          maximumSize: const MaterialStatePropertyAll(
            Size(double.infinity, 100),
          ),
          backgroundColor: const MaterialStatePropertyAll(
            AppElementColors.clickedBlue,
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        child: const Text(
          'Змінити пароль',
          style: TextStyle(
            color: AppTextColors.defaultColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
