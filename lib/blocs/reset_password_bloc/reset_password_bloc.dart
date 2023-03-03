import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book/blocs/reset_password_bloc/reset_password_events.dart';
import 'package:my_book/blocs/reset_password_bloc/reset_password_states.dart';
import 'package:my_book/domen/api_client/api_client.dart';
import 'package:my_book/ui/router/main_router.dart';

class ResetPasswordBloc
    extends Bloc<ResetPasswordBlocEvent, ResetPasswordBlocState> {
  final mailController = TextEditingController();
  ResetPasswordBloc() : super(ResetPasswordBlocInitState()) {
    on<ResetPasswordTryEvent>(_resetPasswordTry);
  }

  _resetPasswordTry(event, emit) async {
    if (state is! ResetPasswordLoadingState) {
      emit(ResetPasswordLoadingState());
      try {
        final response = await ApiClient.resetPassword(mailController.text);
        if (response.replaceAll(r'"', '') == 'Користувача не знайдено') {
          emit(ResetPasswordErrorState(
              errorMessage: response.replaceAll(r'"', '')));
        } else {
          emit(ResetPasswordSuccessState());
          await Future.delayed(const Duration(milliseconds: 250));
          Navigator.pop(event.context);
        }
      } catch (e) {
        print(e);
        emit(ResetPasswordErrorState(
            errorMessage: 'Помилка при відправці листа'));
      }
    }
  }
}
