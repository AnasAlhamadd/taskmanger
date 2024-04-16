part of 'signup_cubit.dart';

@immutable
abstract class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {}

final class SignUpFaliure extends SignUpState {
  final String errMessage;
  SignUpFaliure(this.errMessage);
}
