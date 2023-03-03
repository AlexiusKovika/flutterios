import 'package:flutter/material.dart';

import '../../../../../../../../helper_entities/colors.dart';

class SchoolTitleWidget extends StatelessWidget {
  const SchoolTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Музична школа',
      style: TextStyle(
        fontSize: 20,
        color: AppTextColors.secondaryGrey,
      ),
    );
  }
}
