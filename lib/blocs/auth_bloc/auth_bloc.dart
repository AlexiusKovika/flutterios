import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book/blocs/auth_bloc/auth_bloc_events.dart';
import 'package:my_book/blocs/auth_bloc/auth_bloc_states.dart';
import 'package:my_book/domen/api_client/api_client.dart';
import 'package:my_book/domen/repository/main_repository.dart';

import '../../ui/router/main_router.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  final _repo = MainRepository();

  AuthBloc() : super(AuthBlocInitState()) {
    on<AuthBlocAuthTryEvent>(_authTry);
  }

  void _authTry(event, emit) async {
    if (state is! AuthBlocAuthLoadingState) {
      emit(AuthBlocAuthLoadingState());
      try {
        final login = loginController.text;
        final password = passwordController.text;

        final user = await ApiClient.authLogin(login, password);

        emit(AuthBlocAuthSuccessState());

        await Future.delayed(const Duration(milliseconds: 250));
        MainRouter.animateToMainActivityScreen(event.context, user);
        await _repo.writetoken(user.token!);
      } on DioError catch (e) {
        String errorMessageText = '';
        if (e.response?.statusCode.toString()[0] == '4') {
          errorMessageText = 'Не вірний логін або пароль';
        } else if (e.response?.statusCode.toString()[0] == '5') {
          errorMessageText = 'Сервер не відповідає';
        } else {
          print(e.response?.data);
        }
        emit(AuthBlocAuthErrorState(errorMessageText: errorMessageText));
      }
    }
  }
}
