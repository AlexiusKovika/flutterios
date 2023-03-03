import 'package:flutter/cupertino.dart';

abstract class AuthBlocEvent {}

class AuthBlocAuthTryEvent extends AuthBlocEvent {
  final BuildContext context;

  AuthBlocAuthTryEvent({required this.context});
}
