import 'package:flutter/material.dart';

import '../../../../../../../../helper_entities/colors.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Ви не авторизовані',
      style: TextStyle(
        color: AppTextColors.disabledGrey,
        fontSize: 26,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
