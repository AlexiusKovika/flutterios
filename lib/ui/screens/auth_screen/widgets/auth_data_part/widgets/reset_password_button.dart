import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book/helper_entities/colors.dart';
import 'package:my_book/ui/router/main_router.dart';

import '../../../../../../blocs/auth_bloc/auth_bloc.dart';
import '../../../../../../blocs/auth_bloc/auth_bloc_states.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthBlocState>(
      builder: ((context, state) {
        return AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: state is AuthBlocAuthErrorState
              ? Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        MainRouter.animateToResetPasswordScreen(context);
                      },
                      style: ButtonStyle(
                        overlayColor: MaterialStatePropertyAll(
                            AppElementColors.iconsGrey.withOpacity(0.4)),
                      ),
                      child: Text(
                        'Забули пароль?',
                        style: TextStyle(
                          color: AppElementColors.iconsGrey,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                )
              : SizedBox.shrink(),
        );
      }),
    );
  }
}
