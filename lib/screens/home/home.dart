import 'package:cryptool/screens/home/menu_card.dart';
import 'package:cryptool/screens/home/navbar.dart';
import 'package:flutter/material.dart';
import '../../app.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          'Home',
          style: Theme.of(context).appBarTheme.textTheme.headline1,
        ),
      ),
      drawer: NavBar(),
      body: Container(
        decoration: BoxDecoration(color: Colors.black12),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50.0,
            ),
            MenuCard(
              label: 'Encrypt',
              imagePath: 'assets/images/data-encryption.png',
              route: EncryptRoute,
              // onTap: () {
              //   Navigator.pushNamed(context, EncryptRoute);
              // }
            ),
            SizedBox(
              height: 50.0,
            ),
            MenuCard(
              label: 'Decrypt',
              imagePath: 'assets/images/data-decryption.png',
              route: DecryptRoute,
              // onTap: () {
              //   Navigator.pushNamed(context, EncryptRoute);
              // }
            ),
          ],
        ),
      ),
    );
  }
}
