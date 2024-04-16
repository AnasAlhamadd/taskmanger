abstract class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState {}

final class SignInSuccess extends SignInState {}

final class SignInFaliure extends SignInState {
  final String errMessage;
  SignInFaliure(this.errMessage);
}
