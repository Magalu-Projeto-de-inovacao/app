import 'package:app_desafio_inovacao/core/utils/line.dart';
import 'package:app_desafio_inovacao/models/product_model.dart';
import 'package:flutter/material.dart';

class DetailProductContent extends StatelessWidget {
  final Product product;

  final list = [0, 1, 2, 3, 4, 5, 6, 7];

  DetailProductContent({@required this.product});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: <Widget>[
      Line(),
      _slider(product.images),
      Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            product.name,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          )),
//      description(),
      datasheet(context)
    ]));
  }

  Widget _slider(List images) {
    return Container(
        width: double.infinity,
        height: 300.0,
        child: DefaultTabController(
            length: product.images.length,
            child: PageView(
                children: images
                    .map((item) => Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(item),
                                  fit: BoxFit.contain)),
                          width: double.infinity,
                          height: 300.0,
                        ))
                    .toList())));
  }

  Widget description() {
    return Column(children: <Widget>[
      ListTile(title: Text('Apresentação do produto')),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(product.description),
      )
    ]);
  }

  Widget datasheet(context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text('Ficha Tecnica', style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w500
          ),),
        ),
        Column(
            children: list
                .asMap()
                .map((index, value) =>
                    MapEntry(index, itemDatasheet(index: index)))
                .values
                .toList()),
      ],
    );
  }

  Widget itemDatasheet({@required int index}) {
    return Container(
        height: 56.0,
        color: index % 2 == 0 ? Colors.transparent : Colors.grey.shade200,
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Row(children: <Widget>[
          Flexible(
              flex: 1,
              child: Container(
                  constraints: BoxConstraints.expand(),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text('Marca',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500))
                      ]))),
          Flexible(
              flex: 1,
              child: Container(
                  constraints: BoxConstraints.expand(),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text('Samsung', style: TextStyle(fontSize: 16))
                      ])))
        ]));
  }
}
