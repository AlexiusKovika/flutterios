import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_book/blocs/auth_bloc/auth_bloc_states.dart';

import '../../../../../../blocs/auth_bloc/auth_bloc.dart';
import '../../../../../../blocs/auth_bloc/auth_bloc_events.dart';
import '../../../../../../helper_entities/colors.dart';

class AuthButtonWidget extends StatelessWidget {
  const AuthButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    return BlocBuilder<AuthBloc, AuthBlocState>(
      builder: (BuildContext context, state) {
        if (state is AuthBlocAuthSuccessState) {
          return TextButton(
            onPressed: () {
              authBloc.add(AuthBlocAuthTryEvent(context: context));
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
              'Авторизація успішна',
              style: TextStyle(
                color: AppTextColors.defaultColor,
                fontSize: 20,
              ),
            ),
          );
        } else if (state is AuthBlocAuthErrorState) {
          return TextButton(
            onPressed: () {
              authBloc.add(AuthBlocAuthTryEvent(context: context));
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
        } else if (state is AuthBlocAuthLoadingState) {
          return TextButton(
            onPressed: () {
              authBloc.add(AuthBlocAuthTryEvent(context: context));
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
              authBloc.add(AuthBlocAuthTryEvent(context: context));
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
              'Авторизація',
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
