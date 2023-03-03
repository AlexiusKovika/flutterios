import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book/blocs/registration_bloc/registration_bloc.dart';

import '../../../../../../helper_entities/colors.dart';

class FullNameWidget extends StatelessWidget {
  const FullNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final registrationBloc = BlocProvider.of<RegistrationBloc>(context);
    return TextField(
      controller: registrationBloc.fullNameController,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 20,
        ),
        hintText: 'ПІБ',
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
