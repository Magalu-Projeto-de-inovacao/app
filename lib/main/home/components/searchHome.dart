import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

class SearchHome extends StatelessWidget {
  final Function onSearch;
  final TextEditingController searchController;

  SearchHome({@required this.onSearch, @required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: TextField(
        controller: searchController,
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
            labelStyle: TextStyle(color: Colors.grey.shade700),
            suffixIcon: InkWell(
                child:
                    Icon(Icons.search, color: Theme.of(context).primaryColor),
                onTap: () {
                  onSearch(searchController.text);
                })),
        onSubmitted: (v) {
          onSearch(searchController.text);
        },
      ),
    );
  }
}
