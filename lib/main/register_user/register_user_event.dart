import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterUserEvent extends Equatable {
  RegisterUserEvent([List props = const []]) : super(props);
}

class Register extends RegisterUserEvent {
  String name;
  String phone;
  String email;
  String pass;

  Register(
      {@required this.name,
      @required this.phone,
      @required this.email,
      @required this.pass});
}
