import 'package:flutter/material.dart';

import '../../helper_entities/images.dart';

class LogoWidget extends StatelessWidget {
  final bool isReturnable;
  const LogoWidget({super.key, this.isReturnable = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isReturnable) {
          Navigator.of(context).pop();
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetImages.logo,
            width: MediaQuery.of(context).size.width / 2,
          ),
        ],
      ),
    );
  }
}
