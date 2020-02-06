import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;

  Header({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 40),
        child: Row(
          children: <Widget>[
            Text(
              this.title,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Icon(
              Icons.account_circle,
              size: 35,
            ),
          ],
        ),
      ),
    );
  }
}
