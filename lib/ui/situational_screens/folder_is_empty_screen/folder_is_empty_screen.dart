import 'package:flutter/cupertino.dart';

import '../../../helper_entities/colors.dart';
import '../../../helper_entities/images.dart';

class FolderIsEmptyScreen extends StatelessWidget {
  const FolderIsEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AssetImages.emptyIcon),
        SizedBox(
          height: 50,
        ),
        const Text(
          'Тут нічого немає',
          style: TextStyle(
            color: AppTextColors.disabledGrey,
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
