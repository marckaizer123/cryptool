import 'package:cryptool/app.dart';
import 'package:cryptool/crypto/crypto.dart';
import 'package:flutter/material.dart';

import '../../style.dart';
import 'package:cryptool/crypto/crypto.dart';

class DecryptionScreen extends StatelessWidget {
  final String key_, cipherText;
  final _keyController = TextEditingController();
  final _cipherTextController = TextEditingController();

  DecryptionScreen({this.key_, this.cipherText});

  @override
  Widget build(BuildContext context) {
    _keyController.text = key_ ?? '';
    _cipherTextController.text = cipherText ?? '';

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Decrypt',
          style: Theme.of(context).appBarTheme.toolbarTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 50.0,
              ),

              //Key input
              Container(
                margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
                padding: EdgeInsets.only(left: 5.0),
                decoration: BoxDecoration(
                  color: Colors.black12,
                ),
                child: TextField(
                  controller: _keyController,
                  decoration: InputDecoration(
                    hintText: 'Key ....',
                    border: InputBorder.none,
                  ),
                ),
              ),

              SizedBox(
                height: 20.0,
              ),

              //Plain Text box
              Container(
                margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
                padding: EdgeInsets.only(left: 5.0),
                decoration: BoxDecoration(
                  color: Colors.black12,
                ),
                child: TextField(
                  controller: _cipherTextController,
                  minLines: 5,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Cipher Text....',
                    border: InputBorder.none,
                  ),
                ),
              ),

              //Encrypt Button
              Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(color: Colors.black45),
                child: TextButton(
                  onPressed: () => _onDecryptTap(
                    context,
                    _keyController.text,
                    _cipherTextController.text,
                  ),
                  child: Text(
                    'Decrypt',
                    style: StyleMaker.buttonTextStyle(
                      fontColor: Colors.white,
                      fontSize: 30.0,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _onDecryptTap(BuildContext context, String key, String text) {
    //nasa crypto/decrypt_.dart ang codes

    Map<String, String> cipherkey = Crypto.decrypt(cipherText, key);

    Navigator.pushNamed(context, ResultRoute, arguments: {
      "key": cipherkey['key'],
      "text": cipherkey['text'],
      "crypted": false,
    });
  }
}
