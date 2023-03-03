import 'package:flutter/material.dart';
import 'package:my_book/helper_entities/radio.dart';

abstract class UserBlocEvent {}

class UserBlocGetFullInfoEvent extends UserBlocEvent {
  final String? token;

  UserBlocGetFullInfoEvent({this.token});
}

class UserBlocRewriteEvent extends UserBlocEvent {}

class UserBlocReloadFromUserDetailsEvent extends UserBlocEvent {}

class UserBlocAuthWithInnerTokenEvent extends UserBlocEvent {
  final BuildContext context;

  UserBlocAuthWithInnerTokenEvent(this.context);
}

class UserBlocIsNotAuthEvent extends UserBlocEvent {}

class UserBlocBackpackReloadEvent extends UserBlocEvent {}

class UserBlocAddBookToBackpackEvent extends UserBlocEvent {
  final Map<String, dynamic> data;

  UserBlocAddBookToBackpackEvent({required this.data});
}

class UserBlocRemoveBookFromBackpackEvent extends UserBlocEvent {
  final GlobalKey<AnimatedGridState>? gridKey;
  final Map<String, dynamic> data;
  final int index;

  UserBlocRemoveBookFromBackpackEvent(
      {required this.data, this.gridKey, required this.index});
}

class UserBlocUpdateUserInfoEvent extends UserBlocEvent {}

class UserBlocCommonSchoolChangeEvent extends UserBlocEvent {
  final String school;

  UserBlocCommonSchoolChangeEvent({required this.school});
}

class UserBlocMusicalSchoolChangeEvent extends UserBlocEvent {
  final String school;

  UserBlocMusicalSchoolChangeEvent({required this.school});
}

class UserBlocClassChangeEvent extends UserBlocEvent {
  final String userClass;

  UserBlocClassChangeEvent({required this.userClass});
}

class UserBlocChangeAvatarEvent extends UserBlocEvent {
  final String imagePath;

  UserBlocChangeAvatarEvent({required this.imagePath});
}

class UserBlocChangeCharacterEvent extends UserBlocEvent {
  final RadioCharacter character;

  UserBlocChangeCharacterEvent({required this.character});
}

class UserBlocDownloadBookEvent extends UserBlocEvent {
  final int index;
  final BuildContext? globalContext;

  UserBlocDownloadBookEvent({
    required this.globalContext,
    required this.index,
  });
}
