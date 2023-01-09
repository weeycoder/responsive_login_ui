import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_signin_ui/firebase_repositories/authentication_repo.dart';
import 'package:login_signin_ui/models/user_model.dart';
import 'package:meta/meta.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthenticationRepository _authentication;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  RegisterBloc(this._authentication) : super(RegisterInitial()) {
    on<RegisterUserEvent>(_onRegisterUserEvent);
  }

  Future<void> _onRegisterUserEvent(
      RegisterUserEvent event, Emitter<RegisterState> emit) async {
    emit(RegisterLoading());
    try {
      await _authentication.createUser(event.user).then((value) async {
        emit(RegisterSuccess());
        await _firebaseAuth.signInWithEmailAndPassword(
            email: event.user.email!, password: event.user.password!);
      });
    } catch (e) {
      emit(RegisterFailure(message: e.toString()));
    }
  }
}
