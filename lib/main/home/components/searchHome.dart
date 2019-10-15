import 'package:flutter/material.dart';

class SearchHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
            filled: true,
            hasFloatingPlaceholder: false,
            fillColor: Colors.grey.shade200,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(color: Colors.transparent)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(color: Theme.of(context).primaryColor)),
            labelText: 'Procure por código, nome, marca...',
            labelStyle: TextStyle(
              color: Colors.grey.shade700
            ),
            suffixIcon: InkWell(
                child: Icon(Icons.search, color: Theme.of(context).primaryColor),
                onTap: () {})));
  }
}
