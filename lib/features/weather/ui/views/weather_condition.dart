import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp_bloc/features/weather/ui/bloc/weather_bloc.dart';
import 'package:weatherapp_bloc/features/weather/ui/bloc/weather_state.dart';
import 'package:weatherapp_bloc/features/weather/ui/weather_data_mixin.dart';

import '../../../../core/app_strings.dart';
import '../../../../core/paddings.dart';
import '../../../../core/spacer_size.dart';

class WeatherCondition extends StatelessWidget with WeatherDataMixin {
  const WeatherCondition({super.key, required this.state});

  final WeatherState state;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<WeatherBloc>(),
      builder: (BuildContext context, WeatherState state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Card(
            elevation: padding2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(padding16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(padding16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        AppStrings.temperature,
                        style: TextStyle(
                          fontSize: spacerSize24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: spacerSize10,
                      ),
                      Text(
                        state.weatherResponse != null
                            ? '${ state.weatherResponse!.main.temp } ${AppStrings.kelvin} '
                            : '',
                        style: const TextStyle(
                          fontSize: spacerSize16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: spacerSize16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        AppStrings.skyConditions,
                        style: TextStyle(
                          fontSize: spacerSize24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        state.weatherResponse?.weather.first.description ??
                            '',
                        style: const TextStyle(
                          fontSize: spacerSize20,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
