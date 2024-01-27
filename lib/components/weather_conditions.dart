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
    TextStyle whiteTextStyle = const TextStyle(
      color: Colors.white,
    );
    Widget weatherInfo(String label, String value) {
      return Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Image(
            image: AssetImage(label == "Wind"
                ? "lib/assets/images/wind.png"
                : label == "Chance Rain"
                    ? "lib/assets/images/rain.png"
                    : label == "Pressure"
                        ? "lib/assets/images/pressure.png"
                        : label == "Humidity"
                            ? "lib/assets/images/humidity.png"
                            : "lib/assets/wind.png"),
            height: 50,
            width: 50,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value, style: whiteTextStyle),
              Text(label, style: whiteTextStyle),
            ],
          ),
        ],
      );
    }

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: weatherInfo("Wind",
                  "${weather?.weatherDataList[0].wind.toString()} km/h"),
            ),
            Expanded(
              child: weatherInfo("Chance Rain",
                  "${weather?.weatherDataList[0].pop.toString()} %"),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: weatherInfo("Pressure",
                  "${weather?.weatherDataList[0].pressure.toString()} mbar"),
            ),
            Expanded(
              child: weatherInfo("Humidity",
                  "${weather?.weatherDataList[0].humidity.toString()} %"),
            ),
          ],
        ),
      ],
    );
  }
}
