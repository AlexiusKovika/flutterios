import 'package:flutter/material.dart';
import 'package:my_book/helper_entities/images.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        FocusManager.instance.primaryFocus?.unfocus();
        Navigator.of(context).pop();
      },
      style: const ButtonStyle(
        minimumSize: MaterialStatePropertyAll(Size.zero),
        padding: MaterialStatePropertyAll(EdgeInsets.zero),
        backgroundColor: MaterialStatePropertyAll(Colors.transparent),
        shadowColor: MaterialStatePropertyAll(
          Colors.transparent,
        ),
        surfaceTintColor: MaterialStatePropertyAll(
          Colors.transparent,
        ),
        overlayColor: MaterialStatePropertyAll(Colors.transparent),
      ),
      child: Image.asset(
        AssetImages.backButton,
        height: 30,
      ),
    );
  }
}
