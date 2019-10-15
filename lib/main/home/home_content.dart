import 'package:app_desafio_inovacao/main/home/components/searchHome.dart';
import 'package:flutter/material.dart';

import 'components/productHome.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SearchHome(),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ProductHome(),
              ProductHome(),
              ProductHome(),
              ProductHome(),
              ProductHome(),
              ProductHome(),
              ProductHome(),
              ProductHome(),
              ProductHome(),
              ProductHome(),
              ProductHome(),
            ],
          ),
        ))
      ],
    );

    SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: <Widget>[
          SearchHome(),
          Column(
            children: <Widget>[],
          )
        ],
      ),
    );
  }
}
