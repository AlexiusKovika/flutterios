import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_book/blocs/registration_bloc/registration_bloc_events.dart';
import 'package:my_book/blocs/registration_bloc/registration_bloc_states.dart';
import 'package:my_book/entities/city.dart';

import '../../../../../../blocs/registration_bloc/registration_bloc.dart';
import '../../../../../../helper_entities/colors.dart';

class CityDropDownWidget extends StatelessWidget {
  const CityDropDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final registrationBloc = BlocProvider.of<RegistrationBloc>(context);
    return BlocBuilder<RegistrationBloc, RegistrationBlocState>(
      builder: (context, state) {
        if (state is RegistrationBlocInitState) {
          registrationBloc.add(RegistrationBlocDataLoadingEvent());
          return Center(
            child: LoadingAnimationWidget.staggeredDotsWave(
              color: AppElementColors.mainOrange,
              size: 30,
            ),
          );
        } else {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: DropdownButton<String>(
              value: registrationBloc.city,
              icon: const Icon(Icons.arrow_drop_down),
              elevation: 16,
              isExpanded: true,
              style: const TextStyle(
                color: AppTextColors.secondaryGrey,
                fontSize: 18,
                fontFamily: 'Dniprocity',
                fontWeight: FontWeight.w500,
              ),
              underline: const SizedBox.shrink(),
              onChanged: (String? value) {
                registrationBloc
                    .add(RegistrationBlocCityChangeEvent(city: value!));
              },
              items: registrationBloc.cities!
                  .map<DropdownMenuItem<String>>((City value) {
                return DropdownMenuItem<String>(
                  value: value.cityName,
                  child: Text(
                    value.cityName.toString(),
                  ),
                );
              }).toList(),
            ),
          );
        }
      },
    );
  }
}
