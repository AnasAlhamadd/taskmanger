import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitledtaskmanger/Feature/auth/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(SignInInitial());
  signIn({required String email, required String password}) async {
    emit(SignInLoading());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(SignInSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignInFaliure('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(SignInFaliure('Wrong password provided for that user.'));
      } else if (e.code == "invalid-credential") {
        emit(SignInFaliure('Somthing went Worong Please Try Again'));
      }
    }
  }

  // !SignUp
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
