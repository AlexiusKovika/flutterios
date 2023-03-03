import 'package:flutter/material.dart';
import 'package:my_book/entities/user.dart';
import 'package:my_book/entities/user_details.dart';
import 'package:my_book/helper_entities/pair.dart';
import 'package:my_book/helper_entities/screen_arguments.dart';
import 'package:my_book/helper_entities/screens_fabric.dart';
import 'package:my_book/ui/screens/main_activity_screen/main_activity.dart';

import '../screens/backpack_screen/backpack_screen.dart';
import '../screens/book_page_screen/book_page_screen.dart';
import '../screens/class_choise_screen/class_choise_screen.dart';
import '../screens/start_screen/start_screen.dart';
import '../screens/personal_area_screen/personal_area_screen.dart';

class MainRouter {
  static const startScreenRoute = '/start_screen';
  static const authScreenRoute = '/auth_screen';
  static const resetPasswordRoute = '/reset_password_screen';
  static const registrationScreenRoute = '/registration_screen';
  static const mainActivityScreenRoute = '/main_activity_screen';
  static const classChoiseScreenRoute = '/class_choise_screen';
  static const bookChoiseScreenRoute = '/book_choise_screen';
  static const bookPageScreenRoute = '/book_page_screen';
  static const backpackScreenRoute = '/backpack_screen';
  static const personalAreaScreenRoute = '/student_personal_area_screen';
  static const changePasswordScreenRoute = '/change_password_screen';

  static Widget _transition(context, animation, secondaryAnimation, child) {
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.ease;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }

  static void animateToStartScreen(BuildContext context) =>
      Navigator.of(context).pushNamed(startScreenRoute);

  static void animateToAuthScreen(BuildContext context) =>
      Navigator.of(context).pushNamed(authScreenRoute);

  static void animateToResetPasswordScreen(BuildContext context) =>
      Navigator.of(context).pushNamed(resetPasswordRoute);

  static void animateToRegistrationScreen(BuildContext context) =>
      Navigator.of(context).pushNamed(registrationScreenRoute);

  static void animateToMainActivityScreen(BuildContext context, User? user) =>
      Navigator.of(context).pushNamed(mainActivityScreenRoute, arguments: user);

  static void animateToBookChoiseScreen(BuildContext context,
          UserDetails? userDetails, int index, BuildContext mainContext) =>
      Navigator.of(context).pushNamed(bookChoiseScreenRoute,
          arguments: ScreenArguments(
            data: Pair(index, userDetails),
            context: mainContext,
          ));

  static void animateToBackpackScreen(BuildContext context) =>
      Navigator.of(context).pushNamed(backpackScreenRoute);

  static void animateToBookPageScreen(
      BuildContext context, String pdfPath) async {
    Navigator.of(context).pushNamed(bookPageScreenRoute, arguments: pdfPath);
  }

  static void animateToChangePasswordScreen(
          BuildContext context, UserDetails userDetails) =>
      Navigator.of(context)
          .pushNamed(changePasswordScreenRoute, arguments: userDetails);

  static Route<dynamic>? routeGenrator(RouteSettings settings) {
    if (settings.name == startScreenRoute) {
      return MaterialPageRoute(
        builder: (_) => const StartScreen(),
      );
    } else if (settings.name == authScreenRoute) {
      return PageRouteBuilder(
        transitionsBuilder: _transition,
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: ScreensFabric.authScreen(),
          );
        },
      );
    } else if (settings.name == resetPasswordRoute) {
      return PageRouteBuilder(
        transitionsBuilder: _transition,
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: ScreensFabric.resetPasswordScreen(),
          );
        },
      );
    } else if (settings.name == registrationScreenRoute) {
      return PageRouteBuilder(
        transitionsBuilder: _transition,
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: ScreensFabric.registerScreen(),
          );
        },
      );
    } else if (settings.name == mainActivityScreenRoute) {
      return PageRouteBuilder(
        transitionsBuilder: _transition,
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: MainActivityScreen(
              user: settings.arguments as User?,
            ),
          );
        },
      );
    } else if (settings.name == classChoiseScreenRoute) {
      return MaterialPageRoute(
        builder: (_) => const ClassChoiseScreen(),
      );
    } else if (settings.name == bookChoiseScreenRoute) {
      return MaterialPageRoute(builder: (_) {
        final data = (settings.arguments as ScreenArguments).data;
        final mainContext = (settings.arguments as ScreenArguments).context;
        return ScreensFabric.bookChoiseScreen(data, mainContext);
      });
    } else if (settings.name == personalAreaScreenRoute) {
      return MaterialPageRoute(
        builder: (_) => GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: const PersonalAreaScreen(),
        ),
      );
    } else if (settings.name == bookPageScreenRoute) {
      return MaterialPageRoute(
        builder: (_) => BookPageScreen(
          pdfPath: settings.arguments as String,
        ),
      );
    } else if (settings.name == backpackScreenRoute) {
      return MaterialPageRoute(
        builder: (_) => GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: const BackpackScreen(),
        ),
      );
    } else if (settings.name == changePasswordScreenRoute) {
      return MaterialPageRoute(
        builder: (_) => GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: ScreensFabric.changePasswordScreen(
              settings.arguments as UserDetails),
        ),
      );
    } else {
      return null;
    }
  }
}
