import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class HourlyWeatherComp extends StatelessWidget {
  final Weather? weather;
  final String currentDayName;
  final String currentDay;
  const HourlyWeatherComp(
      {Key? key,
      required this.weather,
      required this.currentDayName,
      required this.currentDay})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget weatherDataColumn(int index) {
      var weatherData = weather?.weatherDataList[index];
      return Column(
        children: [
          Text(weatherData?.dt_txt.split(" ")[1].substring(0, 5).toString() ??
              "loading"),
          Image.network(
            weather?.weatherDataList?.isNotEmpty == true
                ? 'https://openweathermap.org/img/wn/${weather?.weatherDataList[index].icon}@2x.png'
                : 'https://openweathermap.org/img/wn/10d@2x.png',
            width: 50,
            height: 50,
          ),
          Text(
              "${weatherData?.temp_min.toInt()}°/${weatherData?.temp_max.toInt()}°"),
          Text("${weatherData?.pop.toInt()}% rain"),
        ],
      );
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Text(currentDayName),
              const SizedBox(width: 5),
              const Text("|"),
              const SizedBox(width: 5),
              Text(currentDay),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (int i = 0; i < 5; i++) weatherDataColumn(i),
          ],
        ),
      ],
    );
  }
}
