import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_model.dart';

class HourlyWeatherComp extends StatelessWidget {
  final Weather? weather;

  final String currentDay;
  const HourlyWeatherComp(
      {Key? key, required this.weather, required this.currentDay})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String currentDayName = DateFormat.EEEE().format(DateTime.now());
    TextStyle whiteTextStyle = const TextStyle(
      color: Colors.white,
    );
    TextStyle whiteTextStyleBold = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 17,
    );

    Widget weatherDataColumn(int index) {
      var weatherData = weather?.weatherDataList[index];
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
                weatherData?.dt_txt.split(" ")[1].substring(0, 5).toString() ??
                    "loading",
                style: whiteTextStyleBold),
            Image.network(
              weather?.weatherDataList?.isNotEmpty == true
                  ? 'https://openweathermap.org/img/wn/${weather?.weatherDataList[index].icon}@2x.png'
                  : 'https://openweathermap.org/img/wn/10d@2x.png',
              width: 50,
              height: 50,
            ),
            Text(
                "${weatherData?.temp_min.toInt()}°/${weatherData?.temp_max.toInt()}°",
                style: whiteTextStyle),
            Text("${weatherData?.pop.toInt()}% rain", style: whiteTextStyle),
          ],
        ),
      );
    }

    return Container(
      color: Colors.blue,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
            child: Row(
              children: [
                Text(currentDayName, style: whiteTextStyleBold),
                const SizedBox(width: 5),
                Text("|", style: whiteTextStyleBold),
                const SizedBox(width: 5),
                Text(currentDay, style: whiteTextStyleBold),
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
      ),
    );
  }
}
