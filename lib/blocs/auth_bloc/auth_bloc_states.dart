abstract class AuthBlocState {}

class AuthBlocInitState extends AuthBlocState {}

class AuthBlocAuthLoadingState extends AuthBlocState {}

class AuthBlocAuthSuccessState extends AuthBlocState {}

class AuthBlocAuthErrorState extends AuthBlocState {
  final String errorMessageText;

  AuthBlocAuthErrorState({required this.errorMessageText});
}
