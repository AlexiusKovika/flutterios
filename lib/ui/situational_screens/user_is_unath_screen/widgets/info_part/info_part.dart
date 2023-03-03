import 'package:flutter/material.dart';
import 'package:my_book/ui/situational_screens/user_is_unath_screen/widgets/info_part/widgets/buttons_part/buttons_part.dart';

import 'widgets/icon_title_part/icon_title_part.dart';

class InfoPart extends StatelessWidget {
  const InfoPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        IconTitlePart(),
        SizedBox(
          height: 150,
        ),
        ButtonsPart(),
      ],
    );
  }
}
