import 'package:bloc/bloc.dart';
import 'package:app_desafio_inovacao/core/exceptions/exceptions.dart';
import 'package:app_desafio_inovacao/repository/auth_repository.dart';
import 'package:app_desafio_inovacao/services/user.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'dart:io';

import 'login.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthRepository authRepository;
  UserService userService;

  LoginBloc({@required this.authRepository, @required this.userService});

  @override
  LoginState get initialState => LoginState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is ButtonPressed) {
      try {
        yield currentState.copyWith(loading: true);
        final user = await this
            .authRepository
            .login(email: event.email, pass: event.password);
        await this.userService.save(prefs: event.prefs, email: user.email, token: user.token);
        userService.user = user;
        yield currentState.copyWith(
            loading: false, stateAuth: StateAuth.logged);
//      } on NotFoundException {
//        yield currentState.copyWith(
//            loading: false, stateAuth: StateAuth.invalid);
//      } on SocketException {
//        yield currentState.copyWith(
//            loading: false, stateAuth: StateAuth.network);
      } catch (e) {
        print(e);
        yield currentState.copyWith(
            loading: false, stateAuth: StateAuth.unknown);
      }
    }
  }
}
