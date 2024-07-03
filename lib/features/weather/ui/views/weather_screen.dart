import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp_bloc/core/app_strings.dart';
import 'package:weatherapp_bloc/core/paddings.dart';
import 'package:weatherapp_bloc/core/spacer_size.dart';
import 'package:weatherapp_bloc/core/utils.dart';
import 'package:weatherapp_bloc/features/weather/ui/bloc/weather_event.dart';
import 'package:weatherapp_bloc/features/weather/ui/views/additional_information.dart';
import 'package:weatherapp_bloc/features/weather/ui/views/city_text_field.dart';
import 'package:weatherapp_bloc/features/weather/ui/views/weather_condition.dart';
import '../bloc/weather_bloc.dart';
import '../bloc/weather_state.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    final weatherBloc = context.read<WeatherBloc>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          AppStrings.appName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => weatherBloc.add(WeatherResetEvent()),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: BlocConsumer<WeatherBloc, WeatherState>(
        buildWhen: (previousState, newState) =>
            previousState.status != newState.status,
        builder: (context, state) {
          if (state.status == WeatherStatus.weatherFetching) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(padding16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CityTextField(),
                const SizedBox(height: spacerSize20),
                WeatherCondition(state: state),
                const SizedBox(height: spacerSize20),
                AdditionalInformation(
                  state: state,
                )
              ],
            ),
          );
        },
        listener: (BuildContext context, WeatherState state) {
          if (state.status == WeatherStatus.weatherFetchFailure) {
            Utils.showBottomSnackBar(
              state.error ?? AppStrings.somethingWentWrong,
              context,
              error: true,
            );
          }
        },
      ),
    );
  }
}
