import 'package:flutter/material.dart';
import 'package:weatherapp_bloc/features/weather/ui/bloc/weather_state.dart';
import 'package:weatherapp_bloc/features/weather/ui/weather_data_mixin.dart';

import '../../../../core/app_strings.dart';
import '../../../../core/paddings.dart';
import '../../../../core/spacer_size.dart';
import 'additional_info_items.dart';

class AdditionalInformation extends StatelessWidget with WeatherDataMixin {
  const AdditionalInformation({
    super.key,
    required this.state,
  });

  final WeatherState state;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: padding2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(padding16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(padding16),
        child: Column(
          children: [
            const Text(
              AppStrings.additionalInfo,
              style: TextStyle(
                fontSize: spacerSize24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: spacerSize12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalInfoItem(
                    icon: Icons.water_drop,
                    label: AppStrings.humidity,
                    value: state.weatherResponse?.main.humidity.toString() ?? ''),
                AdditionalInfoItem(
                    icon: Icons.air,
                    label: AppStrings.windSpeed,
                    value: state.weatherResponse?.wind.speed.toString() ?? ''),
                AdditionalInfoItem(
                    icon: Icons.beach_access,
                    label: AppStrings.pressure,
                    value: state.weatherResponse?.main.pressure.toString() ?? ''),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
