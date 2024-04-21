part of 'task_cubit.dart';

@immutable
sealed class TaskviewState {}

final class GetDateInitial extends TaskviewState {}

final class GetDateSuccess extends TaskviewState {}

final class AddDateLoading extends TaskviewState {}

final class AddDateSuccess extends TaskviewState {}

final class AddDateFaliure extends TaskviewState {
  final String errMesage;

  AddDateFaliure({required this.errMesage});
}
