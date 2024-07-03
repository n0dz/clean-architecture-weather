import 'package:flutter/material.dart';

@immutable
sealed class WeatherEvent {}

final class WeatherFetchingEvent extends WeatherEvent {}

final class WeatherResetEvent extends WeatherEvent {}

/// Following are commented because I'm using single state class along with an enum for weather states.
/// That approach is easier for smaller features, we can use multiple events also which will be more clear, less error prone.
/// Considering the assignment I choose to use a single state class along-with and enum.

// final class WeatherFetchedEvent extends WeatherEvent {}
// final class WeatherInitialEvent extends WeatherEvent {}
// final class WeatherLoadingEvent extends WeatherEvent {}
