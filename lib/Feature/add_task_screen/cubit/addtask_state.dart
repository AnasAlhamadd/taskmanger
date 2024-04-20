part of 'addtask_cubit.dart';

@immutable
sealed class AddTaskState {}

final class GetDateInitial extends AddTaskState {}

final class GetDateSuccess extends AddTaskState {}
