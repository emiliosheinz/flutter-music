import 'package:flutter/material.dart';

class MusicCard extends StatelessWidget {
  final bool isPlaying;
  final String name;
  final String singer;

  MusicCard(
      {@required this.name, @required this.singer, this.isPlaying = false});

  Widget renderIcon() {
    if (this.isPlaying) {
      return Icon(
        Icons.pause_circle_outline,
        size: 36,
        color: Color.fromRGBO(255, 64, 96, 1),
      );
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    Color textColor = this.isPlaying
        ? Color.fromRGBO(255, 64, 96, 1)
        : Color.fromRGBO(51, 51, 51, 1);

    return Container(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Color.fromRGBO(216, 216, 216, 1),
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                this.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: textColor,
                ),
              ),
              SizedBox(height: 10),
              Text(
                this.singer,
                style: TextStyle(
                  fontSize: 15,
                  color: textColor,
                ),
              ),
            ],
          ),
          Spacer(),
          renderIcon()
        ],
      ),
    );
  }
}
