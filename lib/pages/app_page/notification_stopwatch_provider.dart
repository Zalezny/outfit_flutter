import 'package:flutter/material.dart';

class NotificationStopwatchProvider extends ChangeNotifier {
  bool _isFinishStopwatch;
  NotificationStopwatchProvider(this._isFinishStopwatch);

  bool get isFinishStopwatch => _isFinishStopwatch;

  void finishStopwatch(bool value) {
    _isFinishStopwatch = value;
    notifyListeners();
  }
}
