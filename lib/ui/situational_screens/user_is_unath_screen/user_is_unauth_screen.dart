import 'package:flutter/material.dart';
import 'package:my_book/ui/situational_screens/user_is_unath_screen/widgets/info_part/info_part.dart';

import '../../screen_independent_widgets/logos_with_margin.dart';

class UserIsUnauthScreen extends StatelessWidget {
  const UserIsUnauthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        LogoWidgetWithMargin(),
        Expanded(
          child: InfoPart(),
        ),
      ],
    );
  }
}
