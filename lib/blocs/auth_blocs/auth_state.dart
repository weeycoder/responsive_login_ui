part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  final UserModel user;
  AuthSuccessState({required this.user});
}

class AuthFailureState extends AuthState {
  final String message;
  AuthFailureState({required this.message});
}

class RegisterFailureState extends AuthState {
  final String message;
  RegisterFailureState({required this.message});
}

class SignOutLoadingState extends AuthState {}

class SignOutSuccessState extends AuthState {
  final String message;
  SignOutSuccessState({required this.message});
}
