import 'package:flutter/material.dart';
import 'package:my_book/ui/screen_independent_widgets/logo_widget.dart';

import 'back_buton/back_button_widget.dart';

class TopLogoPart extends StatelessWidget {
  final bool isReturnable;
  const TopLogoPart({super.key, this.isReturnable = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          fit: StackFit.loose,
          alignment: Alignment.center,
          children: [
            LogoWidget(
              isReturnable: isReturnable,
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: BackButtonWidget(),
            ),
          ],
        ),
      ],
    );
  }
}
