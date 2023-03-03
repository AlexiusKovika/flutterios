import 'package:flutter/material.dart';

class AuthScreenTitleWidget extends StatelessWidget {
  const AuthScreenTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Усі книжки в одному місці!',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
