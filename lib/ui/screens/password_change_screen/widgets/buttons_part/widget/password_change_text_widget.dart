import 'package:flutter/material.dart';

import '../../../../../../../../helper_entities/colors.dart';

class PasswordChangeTextWidget extends StatelessWidget {
  const PasswordChangeTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Зміна пароля',
      style: TextStyle(
        fontSize: 18,
        color: AppTextColors.defaultColor,
      ),
    );
  }
}
