import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class ForecastWeatherComp extends StatelessWidget {
  final Weather? weather;
  const ForecastWeatherComp({
    Key? key,
    required this.weather,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget forecasts5Days(int index) {
      var weatherData = weather?.weatherDataList[index];
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Sun"),
          Text("Img ${weatherData?.pop}% rain"),
          Text("Degrees"),
        ],
      );
    }

    return Column(
      children: [
        for (int i = 0; i < 5; i++) forecasts5Days(i * 8),
      ],
    );
  }
}
