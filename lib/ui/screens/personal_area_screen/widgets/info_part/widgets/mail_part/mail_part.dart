import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book/ui/screens/personal_area_screen/widgets/info_part/widgets/mail_part/widgets/mail_input_widget.dart';
import 'package:my_book/ui/screens/personal_area_screen/widgets/info_part/widgets/mail_part/widgets/mail_title_widget.dart';

import '../../../../../../../blocs/user_bloc/user_bloc.dart';

class MailPart extends StatelessWidget {
  const MailPart({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    return userBloc.userDetails!.cityName == 'Дніпро'
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              MailTitleWidget(),
              SizedBox(
                height: 4,
              ),
              MailInputWidget(),
            ],
          )
        : SizedBox.shrink();
  }
}
