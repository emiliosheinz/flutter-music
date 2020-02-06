import 'package:flutter/material.dart';

class MusicType extends StatelessWidget {
  final bool isSelected;
  final String title;

  MusicType({@required this.title, this.isSelected});

  @override
  Widget build(BuildContext context) {
    Color containerColor = isSelected
        ? Color.fromRGBO(255, 64, 96, 1)
        : Color.fromRGBO(255, 240, 242, 1);

    Color textColor =
        isSelected ? Colors.white : Color.fromRGBO(255, 64, 96, 1);

    FontWeight textFontWeight = isSelected ? FontWeight.bold : FontWeight.w400;

    return Container(
      height: 95,
      width: 95,
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: containerColor,
      ),
      child: Center(
        child: Text(
          this.title,
          style: TextStyle(
            color: textColor,
            fontSize: 20,
            fontWeight: textFontWeight,
          ),
        ),
      ),
    );
  }
}
