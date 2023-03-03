import 'package:flutter/material.dart';

import 'package:my_book/ui/screens/password_change_screen/widgets/buttons_part/buttons_part.dart';

import '../../../helper_entities/colors.dart';
import '../../screen_independent_widgets/logos_with_margin.dart';

class PasswordChangeScreen extends StatelessWidget {
  const PasswordChangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppElementColors.backgroundGrey,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    TopLogoPartWithMargin(),
                    Expanded(
                      child: ButtonsPart(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
