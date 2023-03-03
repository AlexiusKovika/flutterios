import 'package:flutter/material.dart';
import 'package:my_book/ui/screens/start_screen/widgets/info_part/widgets/auth_screen_subtitle_widget.dart';
import 'package:my_book/ui/screens/start_screen/widgets/info_part/widgets/auth_screen_title_widget.dart';

import '../../../../screen_independent_widgets/logos_with_margin.dart';

class InfoPart extends StatelessWidget {
  const InfoPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        LogoWidgetWithMargin(),
        SizedBox(
          height: 8,
        ),
        AuthScreenTitleWidget(),
        AuthScreenSubtitleWidget(),
      ],
    );
  }
}
