import 'package:flutter/material.dart';
import 'package:my_book/ui/screen_independent_widgets/top_logo_part.dart';
import 'package:my_book/ui/screens/reset_password_screen.dart/widgets/buttons_part/buttons_part.dart';

import '../../../helper_entities/colors.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

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
                    TopLogoPart(),
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
