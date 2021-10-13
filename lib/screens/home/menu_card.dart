import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final String label;
  final String imagePath;
  final route;

  MenuCard({@required this.label, this.imagePath, this.route});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Center(
        child: Container(
          constraints: BoxConstraints.expand(width: 200.0, height: 200.0),
          decoration: BoxDecoration(
            color: Colors.grey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                imagePath,
                height: 100.0,
                fit: BoxFit.cover,
              ),
              Text(
                '$label',
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
