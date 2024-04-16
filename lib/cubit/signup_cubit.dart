import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  signUp({required String email, required String password}) async {
    emit(SignUpLoading());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(SignUpSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFaliure('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFaliure('The account already exists for that email'));
      }
    } catch (e) {
      emit(SignUpFaliure(e.toString()));
    }
  }
}
