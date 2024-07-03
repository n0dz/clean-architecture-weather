import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp_bloc/core/app_strings.dart';
import 'package:weatherapp_bloc/features/weather/data/repository/weather_repository.dart';
import 'package:weatherapp_bloc/features/weather/ui/bloc/weather_event.dart';
import 'package:weatherapp_bloc/features/weather/ui/bloc/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  final TextEditingController cityNameController = TextEditingController();

  WeatherBloc(this.weatherRepository) : super(WeatherState.initial()) {
    on<WeatherFetchingEvent>(_getCurrentWeather);
    on<WeatherResetEvent>(_resetWeather);
  }

  void _getCurrentWeather(
    WeatherFetchingEvent event,
    Emitter<WeatherState> emit,
  ) async {
    final city = cityNameController.text.trim();
    if (city.isNotEmpty) {
      // city TextField should not be empty
      emit(state.copyWith(city: city, status: WeatherStatus.weatherFetching));
      try {
        final weatherResponse = await weatherRepository.getCurrentWeather(city);
        emit(
          state.copyWith(
              city: city,
              status: WeatherStatus.weatherFetchSuccess,
              weatherResponse: weatherResponse),
        );
      } catch (e) {
        // Error while fetching the Weather
        emit(
          state.copyWith(
            city: city,
            status: WeatherStatus.weatherFetchFailure,
            error: e.toString(),
          ),
        );
      }
    } else {
      // Empty TextField
      emit(
        state.copyWith(
          status: WeatherStatus.weatherFetchFailure,
          error: AppStrings.pleaseEnterCity,
        ),
      );
    }
  }

  _resetWeather(
    WeatherResetEvent event,
    Emitter<WeatherState> emit,
  ) {
    cityNameController.text = '';
    emit(WeatherState.initial());
  }
}
