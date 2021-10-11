import 'package:cryptool/screens/home/menu_card.dart';
import 'package:flutter/material.dart';
import '../../app.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Home',
          style: Theme.of(context).appBarTheme.textTheme.headline1,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.black12),
        child: Column(
          children: <Widget>[
            MenuCard('assets/icons/data-encryption.png', 'Encrypt',
                Icons.enhanced_encryption_rounded),
            MenuCard('assets/icons/data-decryption.png', 'Decrypt',
                Icons.no_encryption_rounded),
          ],
        ),
      ),
    );
  }
}
