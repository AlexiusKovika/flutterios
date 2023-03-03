import 'package:flutter/material.dart';
import 'package:my_book/ui/screens/personal_area_screen/widgets/info_part/widgets/full_name_part/widgets/full_name_input_widget.dart';
import 'package:my_book/ui/screens/personal_area_screen/widgets/info_part/widgets/full_name_part/widgets/full_name_title_widget.dart';

class FullNamePart extends StatelessWidget {
  const FullNamePart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FullNameTitleWidget(),
        SizedBox(
          height: 4,
        ),
        FullNameInputWidget(),
      ],
    );
  }
}
