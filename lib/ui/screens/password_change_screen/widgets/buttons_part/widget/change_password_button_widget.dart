import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_book/blocs/change_password_bloc/change_password_bloc.dart';
import 'package:my_book/blocs/change_password_bloc/change_password_bloc_event.dart';
import 'package:my_book/blocs/change_password_bloc/change_password_bloc_state.dart';

import '../../../../../../../../helper_entities/colors.dart';
import '../../../../../../blocs/user_bloc/user_bloc.dart';

class ChangePasswordButtonWidget extends StatelessWidget {
  const ChangePasswordButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final changePasswordBloc = BlocProvider.of<ChangePasswordBloc>(context);
    final userBloc = BlocProvider.of<UserBloc>(context);
    return BlocBuilder<ChangePasswordBloc, ChangePasswordBlocState>(
      builder: (BuildContext context, state) {
        if (state is ChangePasswordBlocSuccessState) {
          return TextButton(
            onPressed: () {
              changePasswordBloc.add(ChangePasswordBlocTryChangeEvent(
                  id: userBloc.userDetails!.userId!,
                  token: userBloc.userDetails!.token!,
                  context: context));
            },
            style: ButtonStyle(
              minimumSize: const MaterialStatePropertyAll(
                Size(100, 55),
              ),
              maximumSize: const MaterialStatePropertyAll(
                Size(double.infinity, 100),
              ),
              backgroundColor: const MaterialStatePropertyAll(
                AppElementColors.lime,
              ),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            child: const Text(
              'Пароль змінено',
              style: TextStyle(
                color: AppTextColors.defaultColor,
                fontSize: 20,
              ),
            ),
          );
        } else if (state is ChangePasswordBlocErrorState) {
          return TextButton(
            onPressed: () {
              changePasswordBloc.add(ChangePasswordBlocTryChangeEvent(
                  id: userBloc.userDetails!.userId!,
                  token: userBloc.userDetails!.token!,
                  context: context));
            },
            style: ButtonStyle(
              minimumSize: const MaterialStatePropertyAll(
                Size(100, 55),
              ),
              maximumSize: const MaterialStatePropertyAll(
                Size(double.infinity, 100),
              ),
              backgroundColor: const MaterialStatePropertyAll(
                AppElementColors.errorRed,
              ),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            child: Text(
              state.errorMessageText,
              style: const TextStyle(
                color: AppTextColors.defaultColor,
                fontSize: 20,
              ),
            ),
          );
        } else if (state is ChangePasswordBlocLoadingState) {
          return TextButton(
            onPressed: () {
              changePasswordBloc.add(ChangePasswordBlocTryChangeEvent(
                  id: userBloc.userDetails!.userId!,
                  token: userBloc.userDetails!.token!,
                  context: context));
            },
            style: ButtonStyle(
              minimumSize: const MaterialStatePropertyAll(
                Size(100, 55),
              ),
              maximumSize: const MaterialStatePropertyAll(
                Size(double.infinity, 100),
              ),
              backgroundColor: const MaterialStatePropertyAll(
                AppElementColors.mainOrange,
              ),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            child: LoadingAnimationWidget.staggeredDotsWave(
              color: Colors.white,
              size: 30,
            ),
          );
        } else {
          return TextButton(
            onPressed: () {
              changePasswordBloc.add(ChangePasswordBlocTryChangeEvent(
                  id: userBloc.userDetails!.userId!,
                  token: userBloc.userDetails!.token!,
                  context: context));
            },
            style: ButtonStyle(
              minimumSize: const MaterialStatePropertyAll(
                Size(100, 55),
              ),
              maximumSize: const MaterialStatePropertyAll(
                Size(double.infinity, 100),
              ),
              backgroundColor: const MaterialStatePropertyAll(
                AppElementColors.mainOrange,
              ),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            child: const Text(
              'Зміна пароля',
              style: TextStyle(
                color: AppTextColors.defaultColor,
                fontSize: 20,
              ),
            ),
          );
        }
      },
    );
  }
}
