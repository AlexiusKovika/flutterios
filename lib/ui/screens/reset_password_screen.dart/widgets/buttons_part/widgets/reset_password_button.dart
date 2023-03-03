import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../../blocs/reset_password_bloc/reset_password_bloc.dart';
import '../../../../../../blocs/reset_password_bloc/reset_password_events.dart';
import '../../../../../../blocs/reset_password_bloc/reset_password_states.dart';
import '../../../../../../helper_entities/colors.dart';

class ResetButtonWidget extends StatelessWidget {
  const ResetButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final resetPasswordBloc = BlocProvider.of<ResetPasswordBloc>(context);
    return BlocBuilder<ResetPasswordBloc, ResetPasswordBlocState>(
      builder: (BuildContext context, state) {
        if (state is ResetPasswordSuccessState) {
          return TextButton(
            onPressed: () {
              resetPasswordBloc.add(ResetPasswordTryEvent(context: context));
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
              'Запит надіслано на електронну пошту',
              style: TextStyle(
                color: AppTextColors.defaultColor,
                fontSize: 20,
              ),
            ),
          );
        } else if (state is ResetPasswordErrorState) {
          return TextButton(
            onPressed: () {
              resetPasswordBloc.add(ResetPasswordTryEvent(context: context));
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
              state.errorMessage,
              style: const TextStyle(
                color: AppTextColors.defaultColor,
                fontSize: 20,
              ),
            ),
          );
        } else if (state is ResetPasswordLoadingState) {
          return TextButton(
            onPressed: () {
              resetPasswordBloc.add(ResetPasswordTryEvent(context: context));
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
              resetPasswordBloc.add(ResetPasswordTryEvent(context: context));
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
              'Змінити пароль',
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
