import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp_bloc/features/weather/data/models/weather_model.dart';
import 'package:weatherapp_bloc/features/weather/ui/bloc/weather_bloc.dart';

mixin WeatherDataMixin {


  WeatherModel? getWeatherData(BuildContext context) {
    return context.read<WeatherBloc>().state.weatherResponse;
  }

}