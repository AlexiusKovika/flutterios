import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book/blocs/user_bloc/user_bloc.dart';
import 'package:my_book/ui/screens/personal_area_screen/widgets/info_part/widgets/common_school_part/widgets/school_input_widget.dart';
import 'package:my_book/ui/screens/personal_area_screen/widgets/info_part/widgets/common_school_part/widgets/school_title_widget.dart';

class CommonSchoolPart extends StatelessWidget {
  const CommonSchoolPart({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    return userBloc.userDetails!.cityName == 'Дніпро'
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SchoolTitleWidget(),
              SizedBox(
                height: 4,
              ),
              SchoolInputWidget(),
            ],
          )
        : SizedBox.shrink();
  }
}
