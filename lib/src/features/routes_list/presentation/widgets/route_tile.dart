import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RouteTile extends StatelessWidget {
  const RouteTile(
      {super.key, required this.name, required this.cityName, this.onTap});
  final String name;
  final String cityName;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Text(name), const Gap(4), Text(cityName)],
              ),
              const Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
      ),
    );
  }
}
