import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class CurrentWeatherComp extends StatelessWidget {
  final Weather? weather;
  final String currentDayName;
  final String currentMonth;

  const CurrentWeatherComp(
      {Key? key,
      required this.weather,
      required this.currentMonth,
      required this.currentDayName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          weather?.weatherDataList?.isNotEmpty == true
              ? 'https://openweathermap.org/img/wn/${weather?.weatherDataList[0].icon}@2x.png'
              : 'https://openweathermap.org/img/wn/10d@2x.png',
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(currentDayName),
            const SizedBox(width: 10),
            Text(currentMonth),
          ],
        ),
        Text("${weather?.weatherDataList[0].temperature.toString()}°"),
        Text("${weather?.weatherDataList[0].mainCondition.toString()}"),
      ],
    );
  }
}
