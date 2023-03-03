import 'package:flutter/material.dart';
import 'package:my_book/helper_entities/colors.dart';
import 'package:my_book/ui/screens/main_activity_screen/main_activity.dart';

import '../../router/main_router.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Dniprocity',
        dialogBackgroundColor: Colors.white,
        colorScheme: ColorScheme(
          background: AppElementColors.backgroundGrey,
          brightness: Brightness.light,
          error: AppElementColors.errorRed,
          onBackground: AppElementColors.backgroundGrey,
          onError: AppElementColors.errorRed,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: Colors.black,
          primary: AppElementColors.clickedBlue,
          secondary: Colors.white,
          surface: Colors.white,
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
      ),
      // routes: MainRouter.routes,
      onGenerateRoute: MainRouter.routeGenrator,
      // initialRoute: MainRouter.startScreenRoute,
      home: MainActivityScreen(),
      // RegistrationScreen()
    );
  }
}
