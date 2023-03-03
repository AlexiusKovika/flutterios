import 'package:flutter/material.dart';
import 'package:my_book/ui/screens/personal_area_screen/widgets/info_part/widgets/login_part/widgets/login_input_widget.dart';
import 'package:my_book/ui/screens/personal_area_screen/widgets/info_part/widgets/login_part/widgets/login_title_widget.dart';

class LoginPart extends StatelessWidget {
  const LoginPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        LoginTitleWidget(),
        SizedBox(
          height: 4,
        ),
        LoginInputWidget(),
      ],
    );
  }
}
