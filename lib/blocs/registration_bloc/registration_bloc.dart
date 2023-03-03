import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book/blocs/registration_bloc/registration_bloc_events.dart';
import 'package:my_book/blocs/registration_bloc/registration_bloc_states.dart';
import 'package:my_book/domen/api_client/api_client.dart';
import 'package:my_book/entities/city.dart';

import '../../ui/router/main_router.dart';

class RegistrationBloc
    extends Bloc<RegistrationBlocEvent, RegistrationBlocState> {
  final fullNameController = TextEditingController();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  List<City>? cities;
  String? city;
  RegistrationBloc() : super(RegistrationBlocInitState()) {
    on<RegistrationBlocRegistrationTryEvent>(_registrationTry);
    on<RegistrationBlocDataLoadingEvent>(_loadData);
    on<RegistrationBlocCityChangeEvent>(_changeCity);
  }

  void _registrationTry(event, emit) async {
    if (state is! RegistrationBlocRegistrationLoadingState) {
      emit(RegistrationBlocRegistrationLoadingState());
      final login = loginController.text;
      final password = passwordController.text;
      final fullName = fullNameController.text;
      try {
        int cityId = 1;
        for (var value in cities!) {
          if (value.cityName == city) {
            cityId = value.id!;
            break;
          }
        }
        final user =
            await ApiClient.register(login, password, fullName, cityId);
        emit(RegistrationBlocRegistrationSuccessState());
        await Future.delayed(const Duration(milliseconds: 250));
        MainRouter.animateToMainActivityScreen(event.context, user);
      } on DioError catch (e) {
        final response = e.response!;
        if (response.statusCode == 401) {
          final message = e.response!.data;
          emit(RegistrationBlocRegistrationErrorState(
              errorMessageText: message));
        } else {
          final message = e.response!.data[0]['msg'];
          emit(RegistrationBlocRegistrationErrorState(
              errorMessageText: message));
        }
      } catch (e) {
        print(e);
        // final message = (e as DioError).response!.data[0]['msg'];
        // emit(RegistrationBlocRegistrationErrorState(errorMessageText: message));
      }
    }
  }

  void _loadData(event, emit) async {
    cities = await ApiClient.getCities();
    city = cities![0].cityName!;
    emit(RegistrationBlocDataLoadedState());
  }

  void _changeCity(event, emit) {
    city = event.city;
    emit(RegistrationBlocDataLoadedState());
  }
}
