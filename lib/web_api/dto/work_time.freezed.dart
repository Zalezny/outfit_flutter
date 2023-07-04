// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_time.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WorkTime _$WorkTimeFromJson(Map<String, dynamic> json) {
  return _WorkTime.fromJson(json);
}

/// @nodoc
mixin _$WorkTime {
  int get hour => throw _privateConstructorUsedError;
  int get minute => throw _privateConstructorUsedError;
  int get second => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String get sId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkTimeCopyWith<WorkTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkTimeCopyWith<$Res> {
  factory $WorkTimeCopyWith(WorkTime value, $Res Function(WorkTime) then) =
      _$WorkTimeCopyWithImpl<$Res, WorkTime>;
  @useResult
  $Res call(
      {int hour,
      int minute,
      int second,
      String date,
      @JsonKey(name: '_id') String sId});
}

/// @nodoc
class _$WorkTimeCopyWithImpl<$Res, $Val extends WorkTime>
    implements $WorkTimeCopyWith<$Res> {
  _$WorkTimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = null,
    Object? minute = null,
    Object? second = null,
    Object? date = null,
    Object? sId = null,
  }) {
    return _then(_value.copyWith(
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
      second: null == second
          ? _value.second
          : second // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      sId: null == sId
          ? _value.sId
          : sId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WorkTimeCopyWith<$Res> implements $WorkTimeCopyWith<$Res> {
  factory _$$_WorkTimeCopyWith(
          _$_WorkTime value, $Res Function(_$_WorkTime) then) =
      __$$_WorkTimeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int hour,
      int minute,
      int second,
      String date,
      @JsonKey(name: '_id') String sId});
}

/// @nodoc
class __$$_WorkTimeCopyWithImpl<$Res>
    extends _$WorkTimeCopyWithImpl<$Res, _$_WorkTime>
    implements _$$_WorkTimeCopyWith<$Res> {
  __$$_WorkTimeCopyWithImpl(
      _$_WorkTime _value, $Res Function(_$_WorkTime) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = null,
    Object? minute = null,
    Object? second = null,
    Object? date = null,
    Object? sId = null,
  }) {
    return _then(_$_WorkTime(
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
      second: null == second
          ? _value.second
          : second // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      sId: null == sId
          ? _value.sId
          : sId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WorkTime with DiagnosticableTreeMixin implements _WorkTime {
  const _$_WorkTime(
      {required this.hour,
      required this.minute,
      required this.second,
      required this.date,
      @JsonKey(name: '_id') required this.sId});

  factory _$_WorkTime.fromJson(Map<String, dynamic> json) =>
      _$$_WorkTimeFromJson(json);

  @override
  final int hour;
  @override
  final int minute;
  @override
  final int second;
  @override
  final String date;
  @override
  @JsonKey(name: '_id')
  final String sId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WorkTime(hour: $hour, minute: $minute, second: $second, date: $date, sId: $sId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WorkTime'))
      ..add(DiagnosticsProperty('hour', hour))
      ..add(DiagnosticsProperty('minute', minute))
      ..add(DiagnosticsProperty('second', second))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('sId', sId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorkTime &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.minute, minute) || other.minute == minute) &&
            (identical(other.second, second) || other.second == second) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.sId, sId) || other.sId == sId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, hour, minute, second, date, sId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WorkTimeCopyWith<_$_WorkTime> get copyWith =>
      __$$_WorkTimeCopyWithImpl<_$_WorkTime>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WorkTimeToJson(
      this,
    );
  }
}

abstract class _WorkTime implements WorkTime {
  const factory _WorkTime(
      {required final int hour,
      required final int minute,
      required final int second,
      required final String date,
      @JsonKey(name: '_id') required final String sId}) = _$_WorkTime;

  factory _WorkTime.fromJson(Map<String, dynamic> json) = _$_WorkTime.fromJson;

  @override
  int get hour;
  @override
  int get minute;
  @override
  int get second;
  @override
  String get date;
  @override
  @JsonKey(name: '_id')
  String get sId;
  @override
  @JsonKey(ignore: true)
  _$$_WorkTimeCopyWith<_$_WorkTime> get copyWith =>
      throw _privateConstructorUsedError;
}
