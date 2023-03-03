import 'package:flutter/material.dart';
import 'package:my_book/ui/screen_independent_widgets/logo_widget.dart';
import 'package:my_book/ui/screen_independent_widgets/top_logo_part.dart';

class TopLogoPartWithMargin extends StatelessWidget {
  final bool isReturnalble;
  const TopLogoPartWithMargin({super.key, this.isReturnalble = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopLogoPart(
          isReturnable: isReturnalble,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class LogoWidgetWithMargin extends StatelessWidget {
  final bool isReturnable;
  const LogoWidgetWithMargin({super.key, this.isReturnable = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LogoWidget(
          isReturnable: isReturnable,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
