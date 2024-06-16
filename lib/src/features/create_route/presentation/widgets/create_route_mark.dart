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
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 100,
      child: Padding(
        padding: EdgeInsets.all(4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    name,
                    maxLines: 3,
                    softWrap: true,
                  ),
                ),
                const Gap(4),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    addres,
                    maxLines: 3,
                  ),
                ),
              ],
            ),
            Checkbox(value: isMarked, onChanged: onChanged)
          ],
        ),
      ),
    );
  }
}
