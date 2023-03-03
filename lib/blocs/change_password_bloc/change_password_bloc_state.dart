abstract class ChangePasswordBlocState {}

class ChangePasswordBlocInitState extends ChangePasswordBlocState {}

class ChangePasswordBlocSuccessState extends ChangePasswordBlocState {}

class ChangePasswordBlocErrorState extends ChangePasswordBlocState {
  final String errorMessageText;

  ChangePasswordBlocErrorState({required this.errorMessageText});
}

class ChangePasswordBlocLoadingState extends ChangePasswordBlocState {}
