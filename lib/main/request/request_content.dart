import 'package:app_desafio_inovacao/core/utils/line.dart';
import 'package:app_desafio_inovacao/main/request/request.dart';
import 'package:app_desafio_inovacao/main/request/request_bloc.dart';
import 'package:app_desafio_inovacao/main/request/request_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class RequestContent extends StatefulWidget {
  final String logo = 'images/logo.svg';

  final TextEditingController attribute;
  final TextEditingController value;
  final TextEditingController reason;
  final String product;

  RequestContent(
      {@required this.attribute,
      @required this.value,
      @required this.reason,
      @required this.product});

  @override
  _RequestContentState createState() => _RequestContentState();
}

class _RequestContentState extends State<RequestContent> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RequestBloc, RequestState>(
      listener: (context, state) {
        if (state.created) Navigator.pop(context, true);
      },
      child: BlocBuilder<RequestBloc, RequestState>(
        builder: (context, state) {
          return Scaffold(
              key: _scaffoldKey,
              appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  iconTheme:
                      IconThemeData(color: Theme.of(context).primaryColor),
                  title: Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 16.0),
                      child: SvgPicture.asset(widget.logo,
                          semanticsLabel: 'Logo', height: 24))),
              floatingActionButton: FloatingActionButton.extended(
                  onPressed: () {
                    if (widget.value.text.length > 0 &&
                        widget.attribute.text.length > 0 &&
                        widget.reason.text.length > 0) {
                      BlocProvider.of<RequestBloc>(context).dispatch(Create(
                          value: widget.value.text,
                          attribute: widget.attribute.text,
                          reason: widget.reason.text,
                          products: widget.product));
                    } else {
                      _scaffoldKey.currentState.showSnackBar(SnackBar(
                        content: Text('Preencha todas as informações!'),
                        duration: Duration(seconds: 3),
                      ));
                    }
                  },
                  label: Text(state.loading ? 'ENVIANDO' : 'ENVIAR'),
                  icon: Icon(Icons.send)),
              body: SingleChildScrollView(
                  child: Column(children: <Widget>[
                Line(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: widget.attribute,
                        decoration: InputDecoration(
                            hintText: 'Atributo',
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide:
                                    BorderSide(color: Colors.transparent))),
                      ),
                      Container(height: 16),
                      TextField(
                          controller: widget.value,
                          decoration: InputDecoration(
                              hintText: 'Valor',
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide:
                                      BorderSide(color: Colors.transparent)))),
                      Container(height: 16),
                      TextField(
                          controller: widget.reason,
                          minLines: 6,
                          maxLines: 16,
                          decoration: InputDecoration(
                              hintText: 'Motivo',
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide:
                                      BorderSide(color: Colors.transparent))))
                    ],
                  ),
                ),
              ])));
        },
      ),
    );
  }
}
