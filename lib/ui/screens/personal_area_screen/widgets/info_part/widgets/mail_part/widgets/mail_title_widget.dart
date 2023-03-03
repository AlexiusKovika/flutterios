import 'package:flutter/material.dart';

import '../../../../../../../../helper_entities/colors.dart';

class MailTitleWidget extends StatelessWidget {
  const MailTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Електронна адреса',
      style: TextStyle(
        fontSize: 20,
        color: AppTextColors.secondaryGrey,
      ),
    );
  }
}
