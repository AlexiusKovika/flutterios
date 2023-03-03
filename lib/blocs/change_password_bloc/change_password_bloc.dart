import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book/blocs/change_password_bloc/change_password_bloc_event.dart';
import 'package:my_book/blocs/change_password_bloc/change_password_bloc_state.dart';
import 'package:my_book/domen/repository/main_repository.dart';
import 'package:my_book/ui/router/main_router.dart';

import '../../domen/api_client/api_client.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordBlocEvent, ChangePasswordBlocState> {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final verifyPasswordController = TextEditingController();
  ChangePasswordBloc() : super(ChangePasswordBlocInitState()) {
    on<ChangePasswordBlocTryChangeEvent>(changePasswordTry);
  }

  void changePasswordTry(event, emit) async {
    if (newPasswordController.text == verifyPasswordController.text) {
      if (state is! ChangePasswordBlocLoadingState) {
        emit(ChangePasswordBlocLoadingState());
        try {
          final response = await ApiClient.changePassword(
              event.id,
              currentPasswordController.text,
              newPasswordController.text,
              event.token);
          final responseStatus = response.replaceAll(RegExp(r'"'), '');
          if (responseStatus == "Невірний поточний пароль!") {
            emit(
                ChangePasswordBlocErrorState(errorMessageText: responseStatus));
          } else {
            emit(ChangePasswordBlocSuccessState());
            await Future.delayed(const Duration(milliseconds: 250));
            MainRouter.animateToStartScreen(event.context);
            MainRepository().deletetoken(event.token);
          }
        } catch (e) {
          emit(ChangePasswordBlocErrorState(
              errorMessageText: 'Помилка зміни паролю'));
        }
      }
    } else {
      emit(ChangePasswordBlocErrorState(
          errorMessageText: 'Пароль не співпадає'));
    }
  }
}
