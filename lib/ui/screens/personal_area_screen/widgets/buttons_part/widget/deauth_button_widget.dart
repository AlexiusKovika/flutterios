import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book/blocs/user_bloc/user_bloc.dart';
import 'package:my_book/domen/repository/main_repository.dart';
import 'package:my_book/ui/router/main_router.dart';

import '../../../../../../../../helper_entities/colors.dart';

class DeauthButtonWidget extends StatelessWidget {
  const DeauthButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    return SizedBox(
      // width: MediaQuery.of(context).size.width,
      child: TextButton(
        onPressed: () {
          MainRouter.animateToStartScreen(context);
          MainRepository().deletetoken(userBloc.userDetails!.token!);
        },
        style: ButtonStyle(
          minimumSize: const MaterialStatePropertyAll(
            Size(100, 55),
          ),
          maximumSize: const MaterialStatePropertyAll(
            Size(double.infinity, 100),
          ),
          backgroundColor: const MaterialStatePropertyAll(
            AppElementColors.disabledGrey,
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        child: const Text(
          'Вийти з аккаунту',
          style: TextStyle(
            color: AppTextColors.defaultColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
