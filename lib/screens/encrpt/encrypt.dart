import 'package:flutter/material.dart';

class EncryptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Encrypt'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(),
            ElevatedButton(onPressed: null, child: Text('Encrypt'))
          ],
        ),
      ),
    );
  }
}
