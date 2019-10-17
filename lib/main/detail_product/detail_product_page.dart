import 'package:app_desafio_inovacao/main/detail_product/detail_product_bloc.dart';
import 'package:app_desafio_inovacao/main/detail_product/detail_product_content.dart';
import 'package:app_desafio_inovacao/main/profile/profile_page.dart';
import 'package:app_desafio_inovacao/main/request/request_page.dart';
import 'package:app_desafio_inovacao/models/product_model.dart';
import 'package:app_desafio_inovacao/services/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class DetailProductPage extends StatefulWidget {
  final Product product;

  DetailProductPage({@required this.product});

  @override
  _DetailProductPageState createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  final String logo = 'images/logo.svg';
  final UserService userService = new UserService();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
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
                      child: Text(userService.user.email[0].toUpperCase()),
                    ),
                  ))
            ]),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              final added = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          RequestPage(product: widget.product.id)));
              if (added == true) {
                _scaffoldKey.currentState.showSnackBar(SnackBar(
                  content: Text('Informação enviada com sucesso!'),
                  duration: Duration(seconds: 3),
                ));
              }
            },
            label: Text('ADICIONAR INFORMAÇÃO')),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: BlocProvider(
          builder: (context) => DetailProductBloc(),
          child: DetailProductContent(product: widget.product),
        ));
  }
}
