import 'package:flutter/material.dart';
import 'package:my_book/ui/screens/personal_area_screen/widgets/avatar_part/widgets/avatar_image_widget.dart';
import 'package:my_book/ui/screens/personal_area_screen/widgets/avatar_part/widgets/take_picture_button_widget.dart';

class AvatarPart extends StatelessWidget {
  const AvatarPart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2.1,
      height: MediaQuery.of(context).size.width / 2.1,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: const [
          AvatarImageWidget(),
          TakePictureButtonWidget(),
        ],
      ),
    );
  }
}
