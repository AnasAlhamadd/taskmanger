part of 'task_cubit.dart';

@immutable
sealed class TaskviewState {}

final class GetDateInitial extends TaskviewState {}

final class GetDateSuccess extends TaskviewState {}
