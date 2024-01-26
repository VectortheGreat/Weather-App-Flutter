import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherConditionsComp extends StatelessWidget {
  final Weather? weather;

  const WeatherConditionsComp({
    Key? key,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget weatherInfo(String label, String value) {
      return Row(
        children: [
          Image(
              image: AssetImage(label == "Wind"
                  ? "lib/assets/images/wind.png"
                  : label == "Chance Rain"
                      ? "lib/assets/images/rain.png"
                      : label == "Pressure"
                          ? "lib/assets/images/pressure.png"
                          : label == "Humidity"
                              ? "lib/assets/images/humidity.png"
                              : "lib/assets/wind.png")),
          Column(
            children: [
              Text(value),
              Text(label),
            ],
          ),
        ],
      );
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            weatherInfo(
                "Wind", "${weather?.weatherDataList[0].wind.toString()} km/h"),
            weatherInfo("Chance Rain",
                "${weather?.weatherDataList[0].pop.toString()} %"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            weatherInfo("Pressure",
                "${weather?.weatherDataList[0].pressure.toString()} mbar"),
            weatherInfo("Humidity",
                "${weather?.weatherDataList[0].humidity.toString()} %"),
          ],
        ),
      ],
    );
  }
}
