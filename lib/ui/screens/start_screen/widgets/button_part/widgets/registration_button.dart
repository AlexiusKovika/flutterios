import 'package:flutter/material.dart';

import '../../../../../../helper_entities/colors.dart';
import '../../../../../router/main_router.dart';

class RegistrationButton extends StatelessWidget {
  const RegistrationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        MainRouter.animateToRegistrationScreen(context);
      },
      style: ButtonStyle(
        minimumSize: const MaterialStatePropertyAll(
          Size(100, 55),
        ),
        maximumSize: const MaterialStatePropertyAll(
          Size(double.infinity, 100),
        ),
        backgroundColor: const MaterialStatePropertyAll(
          AppElementColors.mainOrange,
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
      child: const Text(
        'Реєстрація',
        style: TextStyle(
          color: AppTextColors.defaultColor,
          fontSize: 20,
        ),
      ),
    );
  }
}
