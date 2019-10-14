import 'package:app_desafio_inovacao/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'register_user.dart';
import 'package:app_desafio_inovacao/core/exceptions/exceptions.dart';

class RegisterUserBloc extends Bloc<RegisterUserEvent, RegisterUserState> {
  UserRepository userRepository;

  RegisterUserBloc({@required this.userRepository});

  @override
  RegisterUserState get initialState => RegisterUserState.initial();

  @override
  Stream<RegisterUserState> mapEventToState(RegisterUserEvent event) async* {
    if (event is Register) {
      yield currentState.copyWith(loading: true);
      try {
        await userRepository.register(
          name: event.name,
          phone: event.phone,
          pass: event.pass,
          email: event.email,
        );
        yield currentState.copyWith(
            loading: false, stateRegister: StateRegister.registered);
      } on BadRequestException {
        yield currentState.copyWith(
            loading: false, stateRegister: StateRegister.invalid);
      } catch (e) {
        yield currentState.copyWith(
            loading: false, stateRegister: StateRegister.unknown);
      }
    }
  }
}
