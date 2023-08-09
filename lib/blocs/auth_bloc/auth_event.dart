part of 'auth_bloc.dart';

import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthSignUpEvent extends AuthEvent {
  final String email;
  final String password;

  const AuthSignUpEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class AuthSignInEvent extends AuthEvent {
  final String email;
  final String password;

  const AuthSignInEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class AuthSignOutEvent extends AuthEvent {
  const AuthSignOutEvent();
}
