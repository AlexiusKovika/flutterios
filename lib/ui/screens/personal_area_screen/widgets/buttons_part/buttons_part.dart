import 'package:flutter/material.dart';

import 'widget/change_password_button_widget.dart';
import 'widget/deauth_button_widget.dart';

class ButtonsPart extends StatelessWidget {
  const ButtonsPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(child: ChangePasswordButtonWidget()),
        SizedBox(
          width: 16,
        ),
        Expanded(child: DeauthButtonWidget()),
      ],
    );
  }
}
