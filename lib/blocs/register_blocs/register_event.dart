part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class RegisterUserEvent extends RegisterEvent {
  final UserModel user;
  RegisterUserEvent({required this.user});
}
