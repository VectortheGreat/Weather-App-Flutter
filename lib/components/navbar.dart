import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/screens/manage_locations.dart';
import 'package:weather_app/screens/settings.dart';

class NavbarComp extends StatelessWidget {
  final Weather? weather;
  const NavbarComp({
    Key? key,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ManageLocations(),
                  ))
            },
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(weather?.cityName ?? "loading city..",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.circle_outlined,
                      color: Colors.white,
                      size: 13,
                    ),
                    onPressed: () => {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.circle_outlined,
                        color: Colors.white, size: 13),
                    onPressed: () => {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.circle_outlined,
                        color: Colors.white, size: 13),
                    onPressed: () => {},
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Settings(),
                  ))
            },
          ),
        ),
      ],
    );
  }
}
