import 'package:flutter/cupertino.dart';
import 'package:my_book/ui/situational_screens/user_is_unath_screen/widgets/info_part/widgets/icon_title_part/widgets/icon_widget.dart';
import 'package:my_book/ui/situational_screens/user_is_unath_screen/widgets/info_part/widgets/icon_title_part/widgets/title_widget.dart';

class IconTitlePart extends StatelessWidget {
  const IconTitlePart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        IconWidget(),
        SizedBox(
          height: 58,
        ),
        TitleWidget(),
      ],
    );
  }
}
