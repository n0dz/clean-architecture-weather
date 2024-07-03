import 'dart:convert';

import 'package:weatherapp_bloc/core/app_strings.dart';

import '../data_source/weather_data_provider.dart';
import '../models/weather_model.dart';

class WeatherRepository {
  final WeatherDataProvider weatherDataProvider;

  WeatherRepository(this.weatherDataProvider);

  Future<WeatherModel> getCurrentWeather(String cityName) async {
    try {
      final weatherData = await weatherDataProvider.getCurrentWeather(cityName);

      final data = jsonDecode(weatherData);
      if (data['cod'] != 200) { // failure occured
        throw AppStrings.errorOccurred;
      } else { // fetched weather
        return WeatherModel.fromJson(data);
      }

    } catch (e) {
      throw e.toString();
    }
  }
}
