import 'package:flutter/material.dart';
import 'package:weather_app/screens/home.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String temperatureUnit = '°C';
  String windUnit = 'km/h';
  String pressureUnit = 'mbar';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          margin:
              const EdgeInsets.only(top: 30, left: 18, right: 18, bottom: 18),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(35),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        ),
                      )
                    },
                  ),
                  const Expanded(
                    child: Text(
                      "Settings",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Text("Unit", style: TextStyle(color: Colors.white)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Temperature unit",
                      style: TextStyle(color: Colors.white)),
                  DropdownButton<String>(
                    value: temperatureUnit,
                    dropdownColor: Colors.grey[800],
                    icon: SizedBox.shrink(),
                    underline: Container(
                      height: 0,
                    ),
                    iconSize: 0.0,
                    elevation: 16,
                    onChanged: (String? newValue) {
                      setState(() {
                        temperatureUnit = newValue!;
                      });
                    },
                    items: <String>['°C', '°F', '°K']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child:
                            Text(value, style: TextStyle(color: Colors.white)),
                      );
                    }).toList(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Wind unit",
                      style: TextStyle(color: Colors.white)),
                  DropdownButton<String>(
                    value: windUnit,
                    dropdownColor: Colors.grey[800],
                    icon: SizedBox.shrink(),
                    underline: Container(
                      height: 0,
                    ),
                    iconSize: 0.0,
                    elevation: 16,
                    onChanged: (String? newValue) {
                      setState(() {
                        windUnit = newValue!;
                      });
                    },
                    items: <String>['km/h', 'mil/h', 'm/s', 'kn']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child:
                            Text(value, style: TextStyle(color: Colors.white)),
                      );
                    }).toList(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Atmospheric pressure unit",
                      style: TextStyle(color: Colors.white)),
                  DropdownButton<String>(
                    value: pressureUnit,
                    dropdownColor: Colors.grey[800],
                    icon: SizedBox.shrink(),
                    underline: Container(
                      height: 0,
                    ),
                    iconSize: 0.0,
                    elevation: 16,
                    onChanged: (String? newValue) {
                      setState(() {
                        pressureUnit = newValue!;
                      });
                    },
                    items: <String>['mbar', 'atm', 'mmHg', 'inHg', 'hPa']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child:
                            Text(value, style: TextStyle(color: Colors.white)),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
