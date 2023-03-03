import 'package:flutter/material.dart';

import '../../../../../helper_entities/images.dart';

class BookImage extends StatelessWidget {
  const BookImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetImages.authScreenBook,
      height: MediaQuery.of(context).size.height / 2.5,
      fit: BoxFit.contain,
    );
  }
}
