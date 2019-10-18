import 'package:app_desafio_inovacao/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_user.dart';

class RegisterUserPage extends StatefulWidget {
  @override
  _RegisterUserPageState createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  RegisterUserBloc registerUserBloc;
  final name = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final pass = TextEditingController();

  @override
  void initState() {
    this.registerUserBloc = RegisterUserBloc(userRepository: UserRepository());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: registerUserBloc,
      builder: (context, RegisterUserState state) {
        return Scaffold(
            floatingActionButton: FloatingActionButton.extended(
                onPressed: !state.loading ? _submit : null,
                icon:  state.loading
                    ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white))
                    : Icon(Icons.save),
                label: Text(state.loading ? 'CRIANDO': 'CRIAR')),
            body: RegisterUserContent(
                registerUserBloc: registerUserBloc,
                name: name,
                phone: phone,
                pass: pass,
                email: email));
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  _submit() {
    registerUserBloc.dispatch(Register(
        name: name.text,
        phone: phone.text,
        email: email.text,
        pass: pass.text));
  }
}
