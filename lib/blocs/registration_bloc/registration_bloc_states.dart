abstract class RegistrationBlocState {}

class RegistrationBlocInitState extends RegistrationBlocState {}

class RegistrationBlocRegistrationLoadingState extends RegistrationBlocState {}

class RegistrationBlocRegistrationSuccessState extends RegistrationBlocState {}

class RegistrationBlocRegistrationErrorState extends RegistrationBlocState {
  final String errorMessageText;

  RegistrationBlocRegistrationErrorState({required this.errorMessageText});
}

class RegistrationBlocDataLoadedState extends RegistrationBlocState {}
