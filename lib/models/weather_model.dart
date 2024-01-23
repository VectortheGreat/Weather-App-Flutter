// class Weather {
//   final String cityName;
//   final double temperature;
//   final String mainCondition;

//   Weather({
//     required this.cityName,
//     required this.temperature,
//     required this.mainCondition,
//   });

//   factory Weather.fromJson(Map<String, dynamic> json) {
//     return Weather(
//         cityName: json['city']['name'],
//         temperature: json['list'][0]['main']['temp'].toDouble(),
//         mainCondition: json['list'][0]['weather'][0]['main']);
//   }
// }

class Weather {
  final String cityName;
  final List<WeatherData> weatherDataList;

  Weather({
    required this.cityName,
    required this.weatherDataList,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    List<WeatherData> weatherDataList = [];

    for (var item in json['list']) {
      WeatherData weatherData = WeatherData.fromJson(item);
      weatherDataList.add(weatherData);
    }

    return Weather(
      cityName: json['city']['name'],
      weatherDataList: weatherDataList,
    );
  }
}

class WeatherData {
  final double temperature;
  final double temp_min;
  final double temp_max;
  final int humidity;
  final int pressure;
  final String mainCondition;
  final double wind;
  final double rain;
  final String dt_txt;

  WeatherData({
    required this.temperature,
    required this.temp_min,
    required this.temp_max,
    required this.humidity,
    required this.pressure,
    required this.mainCondition,
    required this.wind,
    required this.rain,
    required this.dt_txt,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      temperature: json['main']['temp'].toDouble(),
      temp_min: json['main']['temp_min'].toDouble(),
      temp_max: json['main']['temp_max'].toDouble(),
      humidity: json['main']['humidity'],
      pressure: json['main']['pressure'],
      mainCondition: json['weather'][0]['main'],
      wind: json['wind']['speed'].toDouble(),
      rain: json['rain'] == null ? 0.0 : json['rain']['3h'].toDouble(),
      dt_txt: json['dt_txt'],
    );
  }
}
