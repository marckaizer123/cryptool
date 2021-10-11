import 'package:flutter/material.dart';

class MenuCard extends StatefulWidget {
  final String _iconPath;
  final String _menuName;
  final _icon;
  MenuCard(this._iconPath, this._menuName, this._icon);
  @override
  _MenuCardState createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  @override
  Widget build(BuildContext context) {
    print(widget._iconPath);
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
              widget._menuName,
              style: Theme.of(context).textTheme.headline1,
            ),
            Icon(
              widget._icon,
              size: 80.0,
            ),
          ],
        ),
      ),
    );
  }
}
