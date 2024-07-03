import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp_bloc/features/weather/ui/bloc/weather_bloc.dart';

import '../../../../core/app_strings.dart';
import '../../../../core/paddings.dart';
import '../bloc/weather_event.dart';

class CityTextField extends StatelessWidget {
  const CityTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherBloc = context.read<WeatherBloc>();
    return TextField(
      controller: weatherBloc.cityNameController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(padding20),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(padding20),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(padding20),
        ),
        hintText: AppStrings.enterCity,
        contentPadding: const EdgeInsets.only(left: padding20),
      ),
      onSubmitted: (city) {
        weatherBloc.add(WeatherFetchingEvent());
      },
    );
  }
}
