import 'package:app_desafio_inovacao/main/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_desafio_inovacao/main/register_user/components/DateField.dart';
import 'package:flutter_svg/svg.dart';
import 'components/Genre.dart';
import 'register_user.dart';

class RegisterUserContent extends StatefulWidget {
  final RegisterUserBloc registerUserBloc;
  final TextEditingController name;
  final TextEditingController phone;
  final TextEditingController email;
  final TextEditingController pass;

  RegisterUserContent(
      {@required this.registerUserBloc,
      @required this.name,
      @required this.phone,
      @required this.email,
      @required this.pass});

  @override
  _RegisterUserContentState createState() => _RegisterUserContentState();
}

class _RegisterUserContentState extends State<RegisterUserContent> {
  final String logo = 'images/logo.svg';

  @override
  Widget build(BuildContext context) {
    return BlocListener(
        bloc: widget.registerUserBloc,
        listener: (context, RegisterUserState state) {
          if (!state.loading) {
            _showExceptions(state.stateRegister);
            if (state.stateRegister == StateRegister.registered) _goToLogin();
          }
        },
        child: Scaffold(
          appBar: AppBar(
              iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 16.0),
                  child: SvgPicture.asset(logo,
                      semanticsLabel: 'Logo', height: 24))),
          body: ListView(padding: EdgeInsets.all(16.0), children: <Widget>[
            input(label: 'Nome', controller: widget.name),
            input(label: 'Celular', controller: widget.phone),
            input(label: 'E-mail', controller: widget.email),
            input(label: 'Senha', controller: widget.pass)
          ]),
        ));
  }

  Widget input(
      {@required TextEditingController controller, @required String label}) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: TextFormField(
            controller: controller,
            decoration: InputDecoration(labelText: label)));
  }

  void _showExceptions(StateRegister stateRegister) {
    if (stateRegister == StateRegister.invalid)
      _showSnackbar('Esse login já foi utilizado');
    if (stateRegister == StateRegister.unknown)
      _showSnackbar('Tivemos um problema tente novamente mais tarde');
  }

  void _showSnackbar(String message) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void _goToLogin() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
        ModalRoute.withName('/root'));
  }
}
