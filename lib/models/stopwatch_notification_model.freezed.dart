// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stopwatch_notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StopwatchNotificationModel _$StopwatchNotificationModelFromJson(
    Map<String, dynamic> json) {
  return _StopwatchNotificationModel.fromJson(json);
}

/// @nodoc
mixin _$StopwatchNotificationModel {
  String get outfitId => throw _privateConstructorUsedError;
  bool? get isFinishStopwatch => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StopwatchNotificationModelCopyWith<StopwatchNotificationModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StopwatchNotificationModelCopyWith<$Res> {
  factory $StopwatchNotificationModelCopyWith(StopwatchNotificationModel value,
          $Res Function(StopwatchNotificationModel) then) =
      _$StopwatchNotificationModelCopyWithImpl<$Res,
          StopwatchNotificationModel>;
  @useResult
  $Res call({String outfitId, bool? isFinishStopwatch});
}

/// @nodoc
class _$StopwatchNotificationModelCopyWithImpl<$Res,
        $Val extends StopwatchNotificationModel>
    implements $StopwatchNotificationModelCopyWith<$Res> {
  _$StopwatchNotificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outfitId = null,
    Object? isFinishStopwatch = freezed,
  }) {
    return _then(_value.copyWith(
      outfitId: null == outfitId
          ? _value.outfitId
          : outfitId // ignore: cast_nullable_to_non_nullable
              as String,
      isFinishStopwatch: freezed == isFinishStopwatch
          ? _value.isFinishStopwatch
          : isFinishStopwatch // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StopwatchNotificationModelCopyWith<$Res>
    implements $StopwatchNotificationModelCopyWith<$Res> {
  factory _$$_StopwatchNotificationModelCopyWith(
          _$_StopwatchNotificationModel value,
          $Res Function(_$_StopwatchNotificationModel) then) =
      __$$_StopwatchNotificationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String outfitId, bool? isFinishStopwatch});
}

/// @nodoc
class __$$_StopwatchNotificationModelCopyWithImpl<$Res>
    extends _$StopwatchNotificationModelCopyWithImpl<$Res,
        _$_StopwatchNotificationModel>
    implements _$$_StopwatchNotificationModelCopyWith<$Res> {
  __$$_StopwatchNotificationModelCopyWithImpl(
      _$_StopwatchNotificationModel _value,
      $Res Function(_$_StopwatchNotificationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outfitId = null,
    Object? isFinishStopwatch = freezed,
  }) {
    return _then(_$_StopwatchNotificationModel(
      outfitId: null == outfitId
          ? _value.outfitId
          : outfitId // ignore: cast_nullable_to_non_nullable
              as String,
      isFinishStopwatch: freezed == isFinishStopwatch
          ? _value.isFinishStopwatch
          : isFinishStopwatch // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StopwatchNotificationModel extends _StopwatchNotificationModel {
  const _$_StopwatchNotificationModel(
      {required this.outfitId, this.isFinishStopwatch})
      : super._();

  factory _$_StopwatchNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$$_StopwatchNotificationModelFromJson(json);

  @override
  final String outfitId;
  @override
  final bool? isFinishStopwatch;

  @override
  String toString() {
    return 'StopwatchNotificationModel(outfitId: $outfitId, isFinishStopwatch: $isFinishStopwatch)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StopwatchNotificationModel &&
            (identical(other.outfitId, outfitId) ||
                other.outfitId == outfitId) &&
            (identical(other.isFinishStopwatch, isFinishStopwatch) ||
                other.isFinishStopwatch == isFinishStopwatch));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, outfitId, isFinishStopwatch);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StopwatchNotificationModelCopyWith<_$_StopwatchNotificationModel>
      get copyWith => __$$_StopwatchNotificationModelCopyWithImpl<
          _$_StopwatchNotificationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StopwatchNotificationModelToJson(
      this,
    );
  }
}

abstract class _StopwatchNotificationModel extends StopwatchNotificationModel {
  const factory _StopwatchNotificationModel(
      {required final String outfitId,
      final bool? isFinishStopwatch}) = _$_StopwatchNotificationModel;
  const _StopwatchNotificationModel._() : super._();

  factory _StopwatchNotificationModel.fromJson(Map<String, dynamic> json) =
      _$_StopwatchNotificationModel.fromJson;

  @override
  String get outfitId;
  @override
  bool? get isFinishStopwatch;
  @override
  @JsonKey(ignore: true)
  _$$_StopwatchNotificationModelCopyWith<_$_StopwatchNotificationModel>
      get copyWith => throw _privateConstructorUsedError;
}
