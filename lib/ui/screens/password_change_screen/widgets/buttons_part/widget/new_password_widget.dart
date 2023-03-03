import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart' as cupertino;

import '../../../../../../../../helper_entities/colors.dart';
import '../../../../../../blocs/change_password_bloc/change_password_bloc.dart';

class NewPasswordWidget extends StatefulWidget {
  const NewPasswordWidget({super.key});

  @override
  State<NewPasswordWidget> createState() => _NewPasswordWidgetState();
}

class _NewPasswordWidgetState extends State<NewPasswordWidget> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    final changePasswordBloc = BlocProvider.of<ChangePasswordBloc>(context);

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

    return TextField(
      obscureText: isObscured,
      controller: changePasswordBloc.newPasswordController,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 20,
        ),
        hintText: 'Новий пароль',
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
