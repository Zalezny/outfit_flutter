import 'package:freezed_annotation/freezed_annotation.dart';

part 'stopwatch_notification_model.freezed.dart';
part 'stopwatch_notification_model.g.dart';

@freezed
@immutable
abstract class StopwatchNotificationModel with _$StopwatchNotificationModel {
  const StopwatchNotificationModel._();
  const factory StopwatchNotificationModel({
    required String outfitId,
  }) = _StopwatchNotificationModel;

  factory StopwatchNotificationModel.fromJson(Map<String, Object?> json) => _$StopwatchNotificationModelFromJson(json);

  Map<String, String> toMapString() => {
        'outfitId': outfitId,
      };
}
