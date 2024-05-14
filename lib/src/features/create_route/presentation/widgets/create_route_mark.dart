import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CreateRouteMark extends StatelessWidget {
  const CreateRouteMark(
      {super.key,
      required this.name,
      required this.addres,
      required this.isMarked,
      this.onChanged});
  final String name;
  final String addres;
  final bool isMarked;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: MediaQuery.of(context).size.width * 0.8,
      height: 60,
      child: Padding(
        padding: EdgeInsets.all(4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(name),
                const Gap(4),
                Text(addres),
              ],
            ),
            Checkbox(value: isMarked, onChanged: onChanged)
          ],
        ),
      ),
    );
  }
}
