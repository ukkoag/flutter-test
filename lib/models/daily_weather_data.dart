import 'dart:math';

class DailyWeatherData {
  final DateTime timestamp;
  final int temperatureLow;
  final int temperatureHigh;
  final int windHigh;
  final int windLow;
  final double preciptiation;
  final int humidityHigh;
  final int humidityLow;

  DailyWeatherData({
    required this.timestamp,
    required this.temperatureHigh,
    required this.temperatureLow,
    required this.windHigh,
    required this.windLow,
    required this.preciptiation,
    required this.humidityHigh,
    required this.humidityLow,
  });

  static DailyWeatherData genDailyWeather(DateTime timestamp) {
    return DailyWeatherData(
      timestamp: timestamp,
      temperatureHigh: Random().nextInt(25),
      temperatureLow: Random().nextInt(12),
      windHigh: Random().nextInt(18),
      windLow: Random().nextInt(4),
      preciptiation: (Random().nextDouble() * 4),
      humidityHigh: Random().nextInt(22),
      humidityLow: Random().nextInt(8),
    );
  }

  static Future<List<DailyWeatherData>> getDailyWeatherData() {
    final today = DateTime.now();
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    final twoDaysAgo = DateTime.now().subtract(const Duration(days: 2));

    final dailyWeather = [
      genDailyWeather(tomorrow),
      genDailyWeather(today),
      genDailyWeather(yesterday),
      genDailyWeather(twoDaysAgo),
    ];

    return Future.delayed(
      const Duration(seconds: 3),
      () {
        return dailyWeather;
      },
    );
  }
}
