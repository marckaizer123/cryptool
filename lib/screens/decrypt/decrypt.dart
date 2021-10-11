import 'package:flutter/material.dart';

class DecryptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Decrypt'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(),
            ElevatedButton(onPressed: null, child: Text('Decrypt'))
          ],
        ),
      ),
    );
  }
}
