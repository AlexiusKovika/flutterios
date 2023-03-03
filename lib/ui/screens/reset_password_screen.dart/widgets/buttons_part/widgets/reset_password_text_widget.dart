import 'package:flutter/material.dart';

import '../../../../../../helper_entities/colors.dart';

class ResetPasswordTextWidget extends StatelessWidget {
  const ResetPasswordTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Відновлення пароля',
      style: TextStyle(
        fontSize: 18,
        color: AppTextColors.defaultColor,
      ),
    );
  }
}
