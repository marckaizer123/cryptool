import 'package:flutter/material.dart';

class EncryptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Encrypt',
          style: Theme.of(context).appBarTheme.textTheme.headline1,
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }
}
