abstract class ResetPasswordBlocState {}

class ResetPasswordBlocInitState extends ResetPasswordBlocState {}

class ResetPasswordLoadingState extends ResetPasswordBlocState {}

class ResetPasswordSuccessState extends ResetPasswordBlocState {}

class ResetPasswordErrorState extends ResetPasswordBlocState {
  final String errorMessage;

  ResetPasswordErrorState({required this.errorMessage});
}
