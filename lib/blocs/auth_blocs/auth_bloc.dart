import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_signin_ui/firebase_repositories/authentication_repo.dart';
import 'package:login_signin_ui/helpers/shared_preferences.dart';
import 'package:login_signin_ui/models/user_model.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticationRepository _authentication;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  AuthBloc(this._authentication) : super(AuthInitial()) {
    on<RegisterUserEvent>(_onRegisterUserEvent);
    on<AuthenticatedUserEvent>(_onAuthenticatedUserEvent);
    on<SignOutUserEvent>(_onSignOutUserEvent);
  }

  Future<void> _onRegisterUserEvent(
      RegisterUserEvent event, Emitter<AuthState> emit) async {
    emit(RegisterLoadingState());
    try {
      await _authentication.createUser(event.user).then((bool succeed) async {
        if (succeed) {
          await _onAuthenticatedUserEvent(
              AuthenticatedUserEvent(event.user), emit);
          UserModel user = UserModel(
              uid: _firebaseAuth.currentUser!.uid,
              email: event.user.email,
              password: event.user.password);
          await _authentication.addUserToFireStore(user);
          return Future.value(true);
        } else {
          emit(RegisterFailureState(
              message: UserSharedPreferences.getErrorMsg()));
        }
      });
    } catch (e) {
      emit(RegisterFailureState(message: e.toString().split(']')[1]));
    }
  }

  Future<void> _onAuthenticatedUserEvent(
      AuthenticatedUserEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: event.user.email!, password: event.user.password!);
      emit(AuthSuccessState(user: event.user));
    } catch (e) {
      emit(AuthFailureState(message: e.toString().split(']')[1]));
    }
  }

  Future<void> _onSignOutUserEvent(
      SignOutUserEvent event, Emitter<AuthState> emit) async {
    if (!isClosed) {
      emit(SignOutLoadingState());
    } else {
      return;
    }
    try {
      await _firebaseAuth.signOut();
      UserSharedPreferences.clearSharedPreference();
      //await FirebaseAuth.instance.signOut();
      if (!isClosed) {
        emit(SignOutSuccessState(message: 'Sign out successfully'));
      } else {
        return;
      }
    } catch (e) {
      emit(AuthFailureState(message: e.toString()));
    }
  }
}
