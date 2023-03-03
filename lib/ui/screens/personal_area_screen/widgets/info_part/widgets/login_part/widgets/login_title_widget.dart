import 'package:flutter/material.dart';

import '../../../../../../../../helper_entities/colors.dart';

class LoginTitleWidget extends StatelessWidget {
  const LoginTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Логін',
      style: TextStyle(
        fontSize: 20,
        color: AppTextColors.secondaryGrey,
      ),
    );
  }
}
