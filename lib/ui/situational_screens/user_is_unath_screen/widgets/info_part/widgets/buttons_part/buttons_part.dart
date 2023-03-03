import 'package:flutter/material.dart';
import 'package:my_book/ui/situational_screens/user_is_unath_screen/widgets/info_part/widgets/buttons_part/widgets/registration_button.dart';
import 'package:my_book/ui/situational_screens/user_is_unath_screen/widgets/info_part/widgets/buttons_part/widgets/sign_in_button.dart';

class ButtonsPart extends StatelessWidget {
  const ButtonsPart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          SignInButton(),
          SizedBox(
            height: 16,
          ),
          RegistrationButton(),
        ],
      ),
    );
  }
}
