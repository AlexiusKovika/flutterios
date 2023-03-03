import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book/ui/screens/auth_screen/widgets/auth_data_part/widgets/auth_button_widget.dart';
import 'package:my_book/ui/screens/auth_screen/widgets/auth_data_part/widgets/auth_text.dart';
import 'package:my_book/ui/screens/auth_screen/widgets/auth_data_part/widgets/login_widget.dart';
import 'package:my_book/ui/screens/auth_screen/widgets/auth_data_part/widgets/password_widget.dart';
import 'package:my_book/ui/screens/auth_screen/widgets/auth_data_part/widgets/reset_password_button.dart';

import '../../../../../blocs/auth_bloc/auth_bloc.dart';

class ButtonsPart extends StatelessWidget {
  const ButtonsPart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AuthBloc(),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Align(
              alignment: Alignment.center,
              child: AuthTextWidget(),
            ),
            SizedBox(
              height: 40,
            ),
            LoginWidget(),
            SizedBox(
              height: 16,
            ),
            PasswordWidget(),
            SizedBox(
              height: 40,
            ),
            AuthButtonWidget(),
            SizedBox(
              height: 8,
            ),
            ResetPasswordButton(),
          ],
        ),
      ),
    );
  }
}
