import 'package:app_desafio_inovacao/repository/auth_repository.dart';
import 'package:app_desafio_inovacao/services/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'login.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc loginBloc;
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  final String logo = 'images/logo.svg';

  @override
  void initState() {
    this.loginBloc =
        LoginBloc(userService: UserService(), authRepository: AuthRepository());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Padding(
              padding: EdgeInsets.only(
                  top: 120.0, bottom: 32.0, left: 32.0, right: 32.0),
              child: SvgPicture.asset(
                logo,
                semanticsLabel: 'Logo',
                width: 200,
              )),
          LoginContent(loginBloc: this.loginBloc)
        ])));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
