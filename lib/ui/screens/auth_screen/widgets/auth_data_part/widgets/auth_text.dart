import 'package:flutter/material.dart';

import '../../../../../../helper_entities/colors.dart';

class AuthTextWidget extends StatelessWidget {
  const AuthTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Авторизація',
      style: TextStyle(
        fontSize: 18,
        color: AppTextColors.defaultColor,
      ),
    );
  }
}
