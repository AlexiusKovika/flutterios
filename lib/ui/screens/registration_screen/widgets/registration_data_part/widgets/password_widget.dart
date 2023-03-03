import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../blocs/registration_bloc/registration_bloc.dart';
import '../../../../../../helper_entities/colors.dart';
import 'package:flutter/cupertino.dart' as cupertino;

class PasswordWidget extends StatefulWidget {
  const PasswordWidget({super.key});

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    final icon;

    if (Platform.isAndroid) {
      if (isObscured) {
        icon = Icons.visibility_off;
      } else {
        icon = Icons.visibility;
      }
    } else {
      if (isObscured) {
        icon = cupertino.CupertinoIcons.eye_slash;
      } else {
        icon = cupertino.CupertinoIcons.eye;
      }
    }

    final registrationBloc = BlocProvider.of<RegistrationBloc>(context);
    return TextField(
      obscureText: isObscured,
      controller: registrationBloc.passwordController,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 20,
        ),
        hintText: 'Пароль',
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
        suffixIcon: IconButton(
          icon: AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: isObscured
                ? Icon(
                    icon,
                    key: UniqueKey(),
                    color: AppElementColors.iconsGrey,
                  )
                : Icon(
                    icon,
                    key: UniqueKey(),
                    color: AppElementColors.mainOrange,
                  ),
          ),
          onPressed: () {
            // Update the state i.e. toogle the state of passwordVisible variable
            setState(() {
              isObscured = !isObscured;
            });
          },
        ),
      ),
    );
  }
}
