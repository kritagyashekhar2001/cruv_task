import 'package:flutter/material.dart';

class Seat extends StatelessWidget {
  const Seat(
      {super.key,
      required this.index,
      required this.boxColor,
      required this.textColor});
  final int index;
  final Color boxColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.025),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * 0.01), color: boxColor),
      child: Column(children: [
        if (up(index))
          Container(
            height: height * 0.01,
            color: Colors.lightBlue,
          ),
        if (!up(index))
          Text(
            seatPositiionCalculator(index + 1),
            style: TextStyle(
              height: 2,
              color: textColor,
              fontSize: height * 0.012,
            ),
          ),
        Text(
          "${index + 1}",
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w700,
            fontSize: height * 0.02,
          ),
        ),
        if (up(index))
          Text(
            seatPositiionCalculator(index + 1),
            style: TextStyle(
              height: 2,
              color: textColor,
              fontSize: height * 0.012,
            ),
          ),
        Expanded(
          child: Container(),
        ),
        if (!up(index))
          Container(
            height: height * 0.01,
            color: Colors.lightBlue,
          ),
      ]),
    );
  }
}

String seatPositiionCalculator(int index) {
  if (index % 4 == 1) {
    return "LOWER";
  } else if (index % 4 == 2) {
    return "MIDDLE";
  } else if (index % 4 == 3) {
    return "UPPER";
  } else if (index % 8 == 0) {
    return "SIDE UPPER";
  }
  return "SIDE LOWER";
}

bool up(int index) {
  if (index % 8 == 1 || index % 8 == 2 || index % 8 == 3 || index % 8 == 0) {
    return true;
  }
  return false;
}
