import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../blocs/reset_password_bloc/reset_password_bloc.dart';
import '../../../../../../helper_entities/colors.dart';

class MailWidget extends StatelessWidget {
  const MailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final resetPasswordBloc = BlocProvider.of<ResetPasswordBloc>(context);
    return TextField(
      controller: resetPasswordBloc.mailController,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 20,
        ),
        hintText: 'Електронна пошта',
        hintStyle: const TextStyle(
          fontSize: 20,
          color: AppTextColors.secondaryGrey,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
