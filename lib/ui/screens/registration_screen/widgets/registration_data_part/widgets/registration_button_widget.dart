import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_book/blocs/registration_bloc/registration_bloc.dart';
import 'package:my_book/blocs/registration_bloc/registration_bloc_events.dart';
import 'package:my_book/blocs/registration_bloc/registration_bloc_states.dart';

import '../../../../../../helper_entities/colors.dart';

class RegistrationButtonWidget extends StatelessWidget {
  const RegistrationButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final registrationBloc = BlocProvider.of<RegistrationBloc>(context);
    return BlocBuilder<RegistrationBloc, RegistrationBlocState>(
      builder: (BuildContext context, state) {
        if (state is RegistrationBlocRegistrationSuccessState) {
          return TextButton(
            onPressed: () {
              registrationBloc
                  .add(RegistrationBlocRegistrationTryEvent(context: context));
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
              'Реєстрація успішна',
              style: TextStyle(
                color: AppTextColors.defaultColor,
                fontSize: 20,
              ),
            ),
          );
        } else if (state is RegistrationBlocRegistrationErrorState) {
          return TextButton(
            onPressed: () {
              registrationBloc
                  .add(RegistrationBlocRegistrationTryEvent(context: context));
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
                fontSize: 13,
              ),
            ),
          );
        } else if (state is RegistrationBlocRegistrationLoadingState) {
          return TextButton(
            onPressed: () {
              registrationBloc
                  .add(RegistrationBlocRegistrationTryEvent(context: context));
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
              registrationBloc
                  .add(RegistrationBlocRegistrationTryEvent(context: context));
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
              'Реєстрація',
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
