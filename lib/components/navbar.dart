import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

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
            icon: const Icon(Icons.add),
            onPressed: () => {},
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(weather?.cityName ?? "loading city.."),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.circle_outlined),
                    onPressed: () => {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.circle_outlined),
                    onPressed: () => {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.circle_outlined),
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
            icon: const Icon(Icons.more_vert),
            onPressed: () => {},
          ),
        ),
      ],
    );
  }
}
