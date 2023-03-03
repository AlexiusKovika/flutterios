import 'package:flutter/material.dart';

import '../../../../../../helper_entities/colors.dart';

class RegistrationTextWidget extends StatelessWidget {
  const RegistrationTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Реєстрація',
      style: TextStyle(
        fontSize: 18,
        color: AppTextColors.defaultColor,
      ),
    );
  }
}
