import 'package:flutter/cupertino.dart';

abstract class ChangePasswordBlocEvent {}

class ChangePasswordBlocTryChangeEvent extends ChangePasswordBlocEvent {
  final int id;
  final String token;
  final BuildContext context;

  ChangePasswordBlocTryChangeEvent(
      {required this.id, required this.token, required this.context});
}
