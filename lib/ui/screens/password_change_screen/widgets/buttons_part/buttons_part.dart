import 'package:flutter/cupertino.dart';

import 'package:my_book/ui/screens/password_change_screen/widgets/buttons_part/widget/current_password_widget.dart';
import 'package:my_book/ui/screens/password_change_screen/widgets/buttons_part/widget/new_password_widget.dart';
import 'package:my_book/ui/screens/password_change_screen/widgets/buttons_part/widget/password_change_text_widget.dart';
import 'package:my_book/ui/screens/password_change_screen/widgets/buttons_part/widget/password_verify.dart';

import 'widget/change_password_button_widget.dart';

class ButtonsPart extends StatelessWidget {
  const ButtonsPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Align(
          alignment: Alignment.center,
          child: PasswordChangeTextWidget(),
        ),
        SizedBox(
          height: 40,
        ),
        CurrentPasswordWidget(),
        SizedBox(
          height: 16,
        ),
        NewPasswordWidget(),
        SizedBox(
          height: 16,
        ),
        VerifyPasswordWidget(),
        SizedBox(
          height: 40,
        ),
        ChangePasswordButtonWidget(),
      ],
    );
  }
}
