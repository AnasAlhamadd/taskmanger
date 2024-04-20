import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'addtask_state.dart';

class AddtaskCubit extends Cubit<AddtaskState> {
  AddtaskCubit() : super(AddtaskInitial());
}
