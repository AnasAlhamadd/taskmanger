import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitledtaskmanger/core/helper/cache.dart';
import 'package:untitledtaskmanger/cubit/signin_state.dart';
import 'package:untitledtaskmanger/services/services_layer.dart';

class SigninCubit extends Cubit<SignInState> {
  SigninCubit() : super(SignInInitial());

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
}
