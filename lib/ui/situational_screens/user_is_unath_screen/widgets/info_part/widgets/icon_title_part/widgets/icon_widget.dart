import 'package:flutter/material.dart';

import '../../../../../../../../helper_entities/images.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetImages.unauthIcon,
    );
  }
}
