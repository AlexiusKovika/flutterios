abstract class UserBlocState {}

class UserBlocInitState extends UserBlocState {}

class UserBlocDataLoadedState extends UserBlocState {
  final bool? bookIsDownload;

  UserBlocDataLoadedState({this.bookIsDownload});

  // bool operator ==(covariant UserBlocDataLoadedState state) {
  //   return this.bookIsDownload == state.bookIsDownload;
  // }
}

class UserBlocIsNotAuthState extends UserBlocState {}

class UserBlocElementDeletedState extends UserBlocState {
  final int index;

  UserBlocElementDeletedState({required this.index});
}

class UserBlocErrorState extends UserBlocState {
  final String? errorMessage;
  final String? loginErrorMessage;
  final String? mailErrorMessage;
  final String? commonSchoolErrorMessage;
  final String? musicSchoolErrorMessage;

  UserBlocErrorState({
    this.loginErrorMessage,
    this.mailErrorMessage,
    this.commonSchoolErrorMessage,
    this.musicSchoolErrorMessage,
    this.errorMessage,
  });
}
