import 'package:flutter/material.dart';

import '../../../../../../helper_entities/colors.dart';
import '../../../../../router/main_router.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        MainRouter.animateToAuthScreen(context);
      },
      style: ButtonStyle(
        minimumSize: const MaterialStatePropertyAll(
          Size(100, 55),
        ),
        maximumSize: const MaterialStatePropertyAll(
          Size(double.infinity, 100),
        ),
        backgroundColor: const MaterialStatePropertyAll(
          AppElementColors.dimYellow,
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: const BorderSide(color: AppElementColors.mainOrange),
          ),
        ),
      ),
      child: const Text(
        'Вхід',
        style: TextStyle(
          color: AppTextColors.defaultColor,
          fontSize: 20,
        ),
      ),
    );
  }
}
