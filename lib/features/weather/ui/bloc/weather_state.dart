import 'package:weatherapp_bloc/features/weather/data/models/weather_model.dart';

enum WeatherStatus {
  initial,
  weatherLoading,
  weatherFetching,
  weatherFetchSuccess,
  weatherFetchFailure
}

// As this is a simple feature not requiring many states, so used a single state class instead of multiple ones.
class WeatherState {
  WeatherState(
      {this.error, this.city, this.weatherResponse, required this.status});

  final String? error;
  final String? city;
  final WeatherModel? weatherResponse;
  final WeatherStatus status;

  factory WeatherState.initial() => WeatherState(
        status: WeatherStatus.initial,
        error: null,
        city: null,
        weatherResponse: null,
      );

  WeatherState copyWith(
      {String? city,
      String? error,
      WeatherModel? weatherResponse,
      WeatherStatus? status}) {
    return WeatherState(
      error: error ?? this.error,
      city: city ?? this.city,
      weatherResponse: weatherResponse ?? this.weatherResponse,
      status: status ?? this.status,
    );
  }
}
