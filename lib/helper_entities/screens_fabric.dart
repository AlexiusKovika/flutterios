import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book/blocs/change_password_bloc/change_password_bloc.dart';
import 'package:my_book/entities/user_details.dart';
import 'package:my_book/helper_entities/pair.dart';
import 'package:my_book/ui/screens/auth_screen/auth_screen.dart';
import 'package:my_book/ui/screens/registration_screen/registration_screen.dart';
import 'package:my_book/ui/screens/reset_password_screen.dart/reset_password_screen.dart';

import '../blocs/book_bloc/book_bloc.dart';
import '../blocs/user_bloc/user_bloc.dart';
import '../ui/screens/book_choise_screen/book_choise_screen.dart';
import '../ui/screens/password_change_screen/password_change_screen.dart';

abstract class ScreensFabric {
  static Widget authScreen() {
    return const AuthScreen();
  }

  static Widget registerScreen() {
    return const RegistrationScreen();
  }

  static Widget resetPasswordScreen() {
    return const ResetPasswordScreen();
  }

  static Widget bookChoiseScreen(
      Pair<int, UserDetails?> data, BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              UserBloc(userDetails: data.right, mainContext: context),
        ),
        BlocProvider(
          create: (_) => BookBloc(),
        ),
      ],
      child: BookChoiseScreen(
        data: data,
      ),
    );
  }

  static Widget changePasswordScreen(UserDetails userDetails) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) =>
              UserBloc(userDetails: userDetails, mainContext: context),
        ),
        BlocProvider(
          create: (BuildContext context) => ChangePasswordBloc(),
        ),
      ],
      child: const PasswordChangeScreen(),
    );
  }
}
