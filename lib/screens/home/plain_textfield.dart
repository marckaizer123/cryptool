import 'package:flutter/material.dart';

class PlainTextField extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PlainTextFieldState();
}

class _PlainTextFieldState extends State<TextFormField> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[const SizedBox(height: 16.0)],
      ),
    );
  }
}
