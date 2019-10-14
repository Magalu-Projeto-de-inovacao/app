import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String logo = 'images/logo.svg';

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
        title: SvgPicture.asset(
          logo,
          semanticsLabel: 'Logo',
          height: 24,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
