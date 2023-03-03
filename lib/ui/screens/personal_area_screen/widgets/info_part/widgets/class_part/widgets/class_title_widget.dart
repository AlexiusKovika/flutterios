import 'package:flutter/material.dart';

import '../../../../../../../../helper_entities/colors.dart';

class ClassTitleWidget extends StatelessWidget {
  const ClassTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Клас',
      style: TextStyle(
        fontSize: 20,
        color: AppTextColors.secondaryGrey,
      ),
    );
  }
}
