import 'package:flutter/material.dart';

import '../../../../../../../../helper_entities/colors.dart';

class FullNameTitleWidget extends StatelessWidget {
  const FullNameTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'ПІБ',
      style: TextStyle(
        fontSize: 20,
        color: AppTextColors.secondaryGrey,
      ),
    );
  }
}
