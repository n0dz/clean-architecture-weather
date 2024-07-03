import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp_bloc/core/app_strings.dart';
import 'package:weatherapp_bloc/features/weather/data/data_source/weather_data_provider.dart';
import 'package:weatherapp_bloc/features/weather/data/repository/weather_repository.dart';
import 'package:weatherapp_bloc/features/weather/ui/bloc/weather_bloc.dart';
import 'package:weatherapp_bloc/features/weather/ui/views/weather_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      // In case of multiple repos can replace this with MultiRepositoryProvider and provide all the bloc in repos
      create: (BuildContext context) => WeatherRepository(
        WeatherDataProvider(),
      ),
      child: BlocProvider(
        // In case of multiple blocs can replace this with MultiBlocProvider and provide all the bloc in providers
        create: (BuildContext context) => WeatherBloc(
          context.read<WeatherRepository>(),
        ),
        child: MaterialApp(
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          home: const WeatherScreen(),
        ),
      ),
    );
  }
}
