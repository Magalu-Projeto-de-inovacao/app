import 'package:app_desafio_inovacao/main/detail_product/detail_product_bloc.dart';
import 'package:app_desafio_inovacao/main/detail_product/detail_product_content.dart';
import 'package:app_desafio_inovacao/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class DetailProductPage extends StatelessWidget {
  final String logo = 'images/logo.svg';

  final Product product;

  DetailProductPage({@required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
            title: Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 16.0),
                child: SvgPicture.asset(logo,
                    semanticsLabel: 'Logo', height: 24))),
        body: BlocProvider(
          builder: (context) => DetailProductBloc(),
          child: DetailProductContent(product: product),
        ));
  }
}
