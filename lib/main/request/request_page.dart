import 'package:app_desafio_inovacao/main/request/request.dart';
import 'package:app_desafio_inovacao/main/request/request_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class RequestPage extends StatelessWidget {
  final String product;

  TextEditingController attribute;
  TextEditingController value;
  TextEditingController reason;

  RequestPage({@required this.product}) {
    attribute = new TextEditingController();
    value = new TextEditingController();
    reason = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = RequestBloc();
    return BlocProvider(
        builder: (context) => bloc,
        child: RequestContent(
            product: product,
            attribute: attribute,
            value: value,
            reason: reason));
  }
}
