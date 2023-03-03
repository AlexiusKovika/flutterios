import 'package:flutter/material.dart';
import 'package:my_book/ui/screens/class_choise_screen/widgets/logo_title_part/widgets/title_widget.dart';

import '../../../../screen_independent_widgets/logos_with_margin.dart';

class LogoTitlePart extends StatelessWidget {
  const LogoTitlePart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        LogoWidgetWithMargin(
          isReturnable: false,
        ),
        SizedBox(
          height: 22,
        ),
        TitleWidget(),
      ],
    );
  }
}
