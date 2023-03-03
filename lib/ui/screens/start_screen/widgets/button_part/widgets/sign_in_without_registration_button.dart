import 'package:flutter/material.dart';
import 'package:my_book/entities/user.dart';

import '../../../../../../helper_entities/colors.dart';
import '../../../../../router/main_router.dart';

class SignInWithoutRegistrationButton extends StatelessWidget {
  const SignInWithoutRegistrationButton({super.key});

  @override
  Widget build(BuildContext context) {
    // final userBloc = BlocProvider.of<UserBloc>(context);
    return TextButton(
      onPressed: () {
        MainRouter.animateToMainActivityScreen(context, User());
      },
      style: ButtonStyle(
        minimumSize: const MaterialStatePropertyAll(
          Size(100, 55),
        ),
        maximumSize: const MaterialStatePropertyAll(
          Size(double.infinity, 100),
        ),
        backgroundColor: const MaterialStatePropertyAll(
          AppElementColors.disabledGrey,
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
      child: const Text(
        'Почати без реєстрації',
        style: TextStyle(
          color: AppTextColors.secondaryGrey,
          fontSize: 20,
        ),
      ),
    );
  }
}
