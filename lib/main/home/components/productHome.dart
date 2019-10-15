import 'package:app_desafio_inovacao/main/detail_product/detail_product_page.dart';
import 'package:app_desafio_inovacao/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductHome extends StatelessWidget {
  final Product product;

  ProductHome({@required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailProductPage(product: product)));
      },
      highlightColor: Theme.of(context).primaryColor.withOpacity(0.3),
      splashColor: Theme.of(context).primaryColor.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: ClipOval(
                  child: Image.network(
                      product.images.length > 0
                          ? product.images[0]
                          : 'https://via.placeholder.com/150',
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover)),
            ),
            Expanded(
              child: Text(
                product.name,
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
