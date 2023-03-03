import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book/blocs/registration_bloc/registration_bloc.dart';
import 'package:my_book/ui/screens/registration_screen/widgets/registration_data_part/widgets/cities_dropdown_widget.dart';
import 'package:my_book/ui/screens/registration_screen/widgets/registration_data_part/widgets/full_name_widget.dart';
import 'package:my_book/ui/screens/registration_screen/widgets/registration_data_part/widgets/login_widget.dart';
import 'package:my_book/ui/screens/registration_screen/widgets/registration_data_part/widgets/password_widget.dart';
import 'package:my_book/ui/screens/registration_screen/widgets/registration_data_part/widgets/registration_button_widget.dart';
import 'package:my_book/ui/screens/registration_screen/widgets/registration_data_part/widgets/registration_text.dart';

class ButtonsPart extends StatelessWidget {
  const ButtonsPart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegistrationBloc(),
      child: SizedBox(
        // width: MediaQuery.of(context).size.width / 1.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Align(
              alignment: Alignment.center,
              child: RegistrationTextWidget(),
            ),
            SizedBox(
              height: 40,
            ),
            FullNameWidget(),
            SizedBox(
              height: 16,
            ),
            LoginWidget(),
            SizedBox(
              height: 16,
            ),
            PasswordWidget(),
            SizedBox(
              height: 16,
            ),
            CityDropDownWidget(),
            SizedBox(
              height: 40,
            ),
            RegistrationButtonWidget(),
          ],
        ),
      ),
    );
  }
}
