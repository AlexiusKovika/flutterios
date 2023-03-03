import 'package:flutter/material.dart';

abstract class ResetPasswordBlocEvent {}

class ResetPasswordTryEvent extends ResetPasswordBlocEvent {
  BuildContext context;

  ResetPasswordTryEvent({required this.context});
}
