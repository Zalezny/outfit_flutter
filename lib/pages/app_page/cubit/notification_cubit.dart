import 'package:bloc/bloc.dart';

class NotificationCubit extends Cubit<bool> {
  NotificationCubit() : super(false);
  void finishStopwatch(bool value) {
    emit(true);
  }
}
