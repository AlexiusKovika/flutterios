import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:my_book/helper_entities/colors.dart';
import 'package:flutter/cupertino.dart' as cupertino;

import '../../../blocs/user_bloc/user_bloc.dart';
import '../../../blocs/user_bloc/user_bloc_states.dart';

class UsersBottomNavigationBar extends StatelessWidget {
  final PageController controller;
  const UsersBottomNavigationBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserBlocState>(
      builder: (context, state) {
        if (state is UserBlocDataLoadedState ||
            state is UserBlocIsNotAuthState ||
            state is UserBlocErrorState) {
          return Padding(
            padding: const EdgeInsets.only(
              bottom: 16,
              left: 16,
              right: 16,
            ),
            child: GNav(
              onTabChange: (value) => controller.jumpToPage(value),
              backgroundColor: AppElementColors.backgroundGrey,
              color: AppElementColors.iconsGrey,
              activeColor: AppElementColors.textBlue,
              haptic: true,
              padding: const EdgeInsets.all(12),
              tabBorderRadius: 30,
              gap: 10,
              tabBackgroundColor: AppElementColors.clickedBlue.withOpacity(0.6),
              tabs: [
                GButton(
                  icon: Platform.isAndroid
                      ? Icons.book
                      : cupertino.CupertinoIcons.book_fill,
                  text: 'Класи',
                ),
                GButton(
                  icon: Platform.isAndroid
                      ? Icons.backpack
                      : cupertino.CupertinoIcons.briefcase_fill,
                  text: 'Мій портфель',
                ),
                GButton(
                  icon: Platform.isAndroid
                      ? Icons.person
                      : cupertino.CupertinoIcons.person_fill,
                  text: 'Особистий кабінет',
                ),
              ],
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}

// return Container(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 10,
//         vertical: 5,
//       ),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.blue.withOpacity(0.7),
//             offset: Offset.zero,
//             blurRadius: 7,
//             spreadRadius: 0.5,
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: GestureDetector(
//               onTap: () {
//                 MainRouter.animateToClassChoiseScreen(context);
//               },
//               child: Column(
//                 children: const [
//                   Icon(
//                     Icons.book,
//                     color: AppElementColors.iconsGrey,
//                   ),
//                   SizedBox(
//                     height: 4,
//                   ),
//                   Text(
//                     'Класи',
//                     textAlign: TextAlign.center,
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: GestureDetector(
//               onTap: () {
//                 MainRouter.animateToBookChoiseScreen(context);
//               },
//               child: Column(
//                 children: const [
//                   Icon(
//                     Icons.backpack,
//                     color: AppElementColors.iconsGrey,
//                   ),
//                   SizedBox(
//                     height: 4,
//                   ),
//                   Text(
//                     'Мій портфель',
//                     textAlign: TextAlign.center,
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: GestureDetector(
//               onTap: () {
//                 MainRouter.animateToStudentPersonalAreaScreen(context);
//               },
//               child: Column(
//                 children: const [
//                   Icon(
//                     Icons.person,
//                     color: AppElementColors.iconsGrey,
//                   ),
//                   SizedBox(
//                     height: 4,
//                   ),
//                   Text(
//                     'Особистий кабінет',
//                     textAlign: TextAlign.center,
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );