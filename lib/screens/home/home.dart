import 'package:flutter/material.dart';
import '../../app.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(children: [
              const Divider(),
              //Encrypt
              ElevatedButton(
                onPressed: () => _onEncryptTap(context),
                child: Text('Encrypt'),
              ),
              //Decrypt
              ElevatedButton(
                  onPressed: () => _onDecryptTap(context),
                  child: Text('Decrypt'))
            ]),
          ],
        ),
      ),
    );
  }

  _onEncryptTap(BuildContext context) {
    Navigator.pushNamed(context, EncryptRoute);
  }

  _onDecryptTap(BuildContext context) {
    Navigator.pushNamed(context, DecryptRoute);
  }
}
