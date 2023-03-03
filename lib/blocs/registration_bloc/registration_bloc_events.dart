import 'package:flutter/material.dart';

abstract class RegistrationBlocEvent {}

class RegistrationBlocReloadEvent extends RegistrationBlocEvent {}

class RegistrationBlocRegistrationTryEvent extends RegistrationBlocEvent {
  final BuildContext context;

  RegistrationBlocRegistrationTryEvent({required this.context});
}

class RegistrationBlocDataLoadingEvent extends RegistrationBlocEvent {}

class RegistrationBlocCityChangeEvent extends RegistrationBlocEvent {
  final String city;

  RegistrationBlocCityChangeEvent({required this.city});
}
