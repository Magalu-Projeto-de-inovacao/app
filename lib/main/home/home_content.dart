import 'package:app_desafio_inovacao/core/utils/line.dart';
import 'package:app_desafio_inovacao/main/home/components/searchHome.dart';
import 'package:app_desafio_inovacao/main/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/productHome.dart';
import 'home_bloc.dart';

class HomeContent extends StatelessWidget {
  final TextEditingController _searchController = new TextEditingController();

  _onSearch({@required BuildContext context, String query}) {
    BlocProvider.of<HomeBloc>(context).dispatch(Search(query: query));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Line(),
      SearchHome(
          searchController: _searchController,
          onSearch: (query) => _onSearch(context: context, query: query)),
      BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        return Expanded(
            child: state.loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: state.keySearch != ''
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                    Chip(
                                        label: Text(
                                          'Pesquisando por "${state.keySearch ?? ''}"',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        deleteIcon: Icon(Icons.clear,
                                            color: Colors.white),
                                        onDeleted: () {
                                          _onSearch(
                                              context: context, query: '');
                                        },
                                        backgroundColor: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.8))
                                  ])
                            : Container()),
                    Column(
                        children: state.list
                            .map((product) => ProductHome(product: product))
                            .toList())
                  ])));
      })
    ]);
  }
}
