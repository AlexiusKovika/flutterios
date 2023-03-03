import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book/blocs/reset_password_bloc/reset_password_bloc.dart';
import 'package:my_book/ui/screens/reset_password_screen.dart/widgets/buttons_part/widgets/mail_widget.dart';
import 'package:my_book/ui/screens/reset_password_screen.dart/widgets/buttons_part/widgets/reset_password_button.dart';
import 'package:my_book/ui/screens/reset_password_screen.dart/widgets/buttons_part/widgets/reset_password_text_widget.dart';

class ButtonsPart extends StatelessWidget {
  const ButtonsPart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ResetPasswordBloc(),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Align(
              alignment: Alignment.center,
              child: ResetPasswordTextWidget(),
            ),
            SizedBox(
              height: 40,
            ),
            MailWidget(),
            SizedBox(
              height: 40,
            ),
            ResetButtonWidget(),
          ],
        ),
      ),
    );
  }
}
