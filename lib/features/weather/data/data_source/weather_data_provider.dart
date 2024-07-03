import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../../../../core/app_assets.dart';
import '../../../../core/app_strings.dart';

class WeatherDataProvider {
  final String baseUrl = "https://api.openweathermap.org/data/2.5/weather?q=";

  Future<String> getCurrentWeather(String cityName) async {
    await dotenv.load(fileName: AppAssets.secretFile);
    final String apiKey = dotenv.get(AppStrings.weatherApiKey);
    final url = '$baseUrl$cityName&appid=$apiKey';
    try {
      final res = await http.get(
        Uri.parse(url),
      );
      return res.body;
    } catch (e) {
      throw e.toString();
    }
  }
}
