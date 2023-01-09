part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class RegisterUserEvent extends AuthEvent {
  final UserModel user;
  RegisterUserEvent(this.user);
}

class AuthenticatedUserEvent extends AuthEvent {
  final UserModel user;
  AuthenticatedUserEvent(this.user);
}

class SignOutUserEvent extends AuthEvent {}
