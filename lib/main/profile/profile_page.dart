import 'package:app_desafio_inovacao/core/prefs/preferences.dart';
import 'package:app_desafio_inovacao/main/login/login_page.dart';
import 'package:app_desafio_inovacao/services/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final String logo = 'images/logo.svg';
  final UserService userService = new UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 16.0),
                child: SvgPicture.asset(logo,
                    semanticsLabel: 'Logo', height: 24))),
        body: Container(
          constraints: BoxConstraints.expand(),
//          color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                  maxRadius: 80,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Text(userService.user.email[0].toUpperCase(),
                      style: TextStyle(fontSize: 36))),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(userService.user.email,
                      style: TextStyle(color: Colors.black54, fontSize: 16))),
              FlatButton(
                child: Text('SAIR', style: TextStyle(color: Colors.red)),
                onPressed: () {
                  userService.logout(prefs: Preferences());
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      ModalRoute.withName('/root'));
                },
              ),
              Container(
                height: 56,
              )
            ],
          ),
        ));
  }
}
