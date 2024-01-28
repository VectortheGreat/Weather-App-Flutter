import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
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
      DateTime now = DateTime.now();
      DateTime nextDay = now.add(Duration(days: index));
      String nextDayName = DateFormat.E().format(nextDay);

      var weatherData = weather?.weatherDataList[index];

      TextStyle whiteTextStyle = const TextStyle(
        color: Colors.white,
        fontSize: 15,
      );
      TextStyle whiteTextStyleBold = const TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      );
      return Padding(
        padding: const EdgeInsets.only(right: 30, left: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              nextDayName,
              style: whiteTextStyleBold,
            ),
            Row(
              children: [
                Image.network(
                  weather?.weatherDataList?.isNotEmpty == true
                      ? 'https://openweathermap.org/img/wn/${weather?.weatherDataList[0].icon}@2x.png'
                      : 'https://openweathermap.org/img/wn/10d@2x.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                Text(
                  "${weatherData?.pop.toInt()}% rain",
                  style: whiteTextStyle,
                ),
              ],
            ),
            Text(
              "${weatherData?.temp_min.toInt()}°/${weatherData?.temp_max.toInt()}°",
              style: whiteTextStyle,
            ),
          ],
        ),
      );
    }

    return Container(
      color: Colors.blue,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 20, top: 10, bottom: 5),
            child: const Text(
              "Forecast for 5 Days",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ),
          for (int i = 0; i < 5; i++) forecasts5Days(i * 8),
        ],
      ),
    );
  }
}
