import 'package:app_desafio_inovacao/main/home/home_content.dart';
import 'package:app_desafio_inovacao/main/profile/profile_page.dart';
import 'package:app_desafio_inovacao/services/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String logo = 'images/logo.svg';
  final UserService userService = new UserService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 16.0),
                child:
                    SvgPicture.asset(logo, semanticsLabel: 'Logo', height: 24)),
            actions: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePage()));
                      },
                      child: CircleAvatar(
                          maxRadius: 16,
                          backgroundColor: Theme.of(context).primaryColor,
                          child:
                              Text(userService.user.email[0].toUpperCase()))))
            ]),
        body: BlocProvider(
          builder: (context) => HomeBloc()..dispatch(Search()),
          child: HomeContent(),
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
