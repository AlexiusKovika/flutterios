import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_book/helper_entities/colors.dart';
import 'package:flutter/cupertino.dart' as cupertino;

import '../../../../../../blocs/user_bloc/user_bloc.dart';
import '../../../../../../blocs/user_bloc/user_bloc_events.dart';

class TakePictureButtonWidget extends StatelessWidget {
  const TakePictureButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    return Container(
      child: Align(
        alignment: Alignment.centerRight,
        child: FractionalTranslation(
          translation: const Offset(0.5, 0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  offset: const Offset(3, 3),
                  blurRadius: 2,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: IconButton(
              onPressed: () async {
                final image =
                    await ImagePicker().pickImage(source: ImageSource.gallery);

                if (image != null) {
                  userBloc.add(
                    UserBlocChangeAvatarEvent(
                      imagePath: image.path,
                    ),
                  );
                }
              },
              style: ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              splashColor: AppElementColors.clickedBlue,
              iconSize: 30,
              icon: Icon(
                Platform.isAndroid
                    ? Icons.camera
                    : cupertino.CupertinoIcons.camera_viewfinder,
                color: AppElementColors.clickedBlue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
