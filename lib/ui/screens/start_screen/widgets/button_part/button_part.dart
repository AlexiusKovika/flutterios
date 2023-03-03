import 'package:flutter/material.dart';
import 'package:my_book/ui/screens/start_screen/widgets/button_part/widgets/registration_button.dart';
import 'package:my_book/ui/screens/start_screen/widgets/button_part/widgets/sign_in_button.dart';
import 'package:my_book/ui/screens/start_screen/widgets/button_part/widgets/sign_in_without_registration_button.dart';

class ButtonPart extends StatelessWidget {
  const ButtonPart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          SignInButton(),
          SizedBox(
            height: 16,
          ),
          RegistrationButton(),
          SizedBox(
            height: 16,
          ),
          SignInWithoutRegistrationButton(),
        ],
      ),
    );
  }
}
