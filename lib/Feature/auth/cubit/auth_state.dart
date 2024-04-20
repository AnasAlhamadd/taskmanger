abstract class AuthState {}

final class SignInInitial extends AuthState {}

final class SignInLoading extends AuthState {}

final class SignInSuccess extends AuthState {}

final class SignInFaliure extends AuthState {
  final String errMessage;
  SignInFaliure(this.errMessage);
}

final class SignUpLoading extends AuthState {}

final class SignUpSuccess extends AuthState {}

final class SignUpFaliure extends AuthState {
  final String errMessage;
  SignUpFaliure(this.errMessage);
}
