import 'package:flutter/material.dart';

class ProductHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      highlightColor: Theme.of(context).primaryColor.withOpacity(0.3),
      splashColor: Theme.of(context).primaryColor.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: ClipOval(
                  child: Image.network('https://via.placeholder.com/150',
                      width: 70, height: 70, fit: BoxFit.cover)),
            ),
            Expanded(
              child: Text(
                'Notebook Acer Aspire 3 A315-33-C39F Dual Core - 4GB 500GB 15,6” Windows 10',
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
