import 'package:flutter/material.dart';

class AuthScreenSubtitleWidget extends StatelessWidget {
  const AuthScreenSubtitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Тут збережені усі підручники, за якими навчаються у школі. Знаходь свої та користуйся!',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
