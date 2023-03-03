import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book/ui/screens/personal_area_screen/widgets/info_part/widgets/class_part/class_part.dart';
import 'package:my_book/ui/screens/personal_area_screen/widgets/info_part/widgets/full_name_part/full_name_part.dart';
import 'package:my_book/ui/screens/personal_area_screen/widgets/info_part/widgets/login_part/login_part.dart';
import 'package:my_book/ui/screens/personal_area_screen/widgets/info_part/widgets/mail_part/mail_part.dart';
import 'package:my_book/ui/screens/personal_area_screen/widgets/info_part/widgets/common_school_part/common_school_part.dart';
import 'package:my_book/ui/screens/personal_area_screen/widgets/info_part/widgets/musical_school_part/musical_school_part.dart';

import '../../../../../blocs/user_bloc/user_bloc.dart';
import '../../../../../blocs/user_bloc/user_bloc_states.dart';

class StudentInfoPart extends StatelessWidget {
  const StudentInfoPart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserBlocState>(
      builder: (context, state) {
        return SizedBox(
          // width: MediaQuery.of(context).size.width / 1.2,
          child: Column(
            children: const [
              FullNamePart(),
              SizedBox(
                height: 12,
              ),
              LoginPart(),
              SizedBox(
                height: 12,
              ),
              MailPart(),
              SizedBox(
                height: 12,
              ),
              ClassDropdownPart(),
              SizedBox(
                height: 12,
              ),
              CommonSchoolPart(),
              SizedBox(
                height: 12,
              ),
              MusicalSchoolPart(),
            ],
          ),
        );
      },
    );
  }
}
