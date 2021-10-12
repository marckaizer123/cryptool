import 'package:flutter/material.dart';

class DecryptMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {print('tap')},
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        constraints: BoxConstraints.expand(height: 200.0),
        padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
        margin:
            EdgeInsets.only(left: 60.0, top: 15.0, right: 60.0, bottom: 10.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Text(
              'Decrypt',
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
      ),
    );
  }
}
