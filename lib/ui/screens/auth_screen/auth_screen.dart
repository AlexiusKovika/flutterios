import 'package:flutter/material.dart';
import 'package:my_book/ui/screens/auth_screen/widgets/auth_data_part/buttons_part.dart';

import '../../../helper_entities/colors.dart';
import '../../screen_independent_widgets/logos_with_margin.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

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
