// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outfit_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OutfitDto _$OutfitDtoFromJson(Map<String, dynamic> json) {
  return _OutfitDto.fromJson(json);
}

/// @nodoc
mixin _$OutfitDto {
  @JsonKey(name: '_id')
  String get sId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get hour => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  List<WorkTime> get momHours => throw _privateConstructorUsedError;
  List<WorkTime> get kateHours => throw _privateConstructorUsedError;
  @JsonKey(name: '__v')
  int get iV => throw _privateConstructorUsedError;
  bool get ended => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OutfitDtoCopyWith<OutfitDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutfitDtoCopyWith<$Res> {
  factory $OutfitDtoCopyWith(OutfitDto value, $Res Function(OutfitDto) then) =
      _$OutfitDtoCopyWithImpl<$Res, OutfitDto>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String sId,
      String title,
      String hour,
      String date,
      List<WorkTime> momHours,
      List<WorkTime> kateHours,
      @JsonKey(name: '__v') int iV,
      bool ended});
}

/// @nodoc
class _$OutfitDtoCopyWithImpl<$Res, $Val extends OutfitDto>
    implements $OutfitDtoCopyWith<$Res> {
  _$OutfitDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sId = null,
    Object? title = null,
    Object? hour = null,
    Object? date = null,
    Object? momHours = null,
    Object? kateHours = null,
    Object? iV = null,
    Object? ended = null,
  }) {
    return _then(_value.copyWith(
      sId: null == sId
          ? _value.sId
          : sId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      momHours: null == momHours
          ? _value.momHours
          : momHours // ignore: cast_nullable_to_non_nullable
              as List<WorkTime>,
      kateHours: null == kateHours
          ? _value.kateHours
          : kateHours // ignore: cast_nullable_to_non_nullable
              as List<WorkTime>,
      iV: null == iV
          ? _value.iV
          : iV // ignore: cast_nullable_to_non_nullable
              as int,
      ended: null == ended
          ? _value.ended
          : ended // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OutfitDtoCopyWith<$Res> implements $OutfitDtoCopyWith<$Res> {
  factory _$$_OutfitDtoCopyWith(
          _$_OutfitDto value, $Res Function(_$_OutfitDto) then) =
      __$$_OutfitDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String sId,
      String title,
      String hour,
      String date,
      List<WorkTime> momHours,
      List<WorkTime> kateHours,
      @JsonKey(name: '__v') int iV,
      bool ended});
}

/// @nodoc
class __$$_OutfitDtoCopyWithImpl<$Res>
    extends _$OutfitDtoCopyWithImpl<$Res, _$_OutfitDto>
    implements _$$_OutfitDtoCopyWith<$Res> {
  __$$_OutfitDtoCopyWithImpl(
      _$_OutfitDto _value, $Res Function(_$_OutfitDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sId = null,
    Object? title = null,
    Object? hour = null,
    Object? date = null,
    Object? momHours = null,
    Object? kateHours = null,
    Object? iV = null,
    Object? ended = null,
  }) {
    return _then(_$_OutfitDto(
      sId: null == sId
          ? _value.sId
          : sId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      momHours: null == momHours
          ? _value._momHours
          : momHours // ignore: cast_nullable_to_non_nullable
              as List<WorkTime>,
      kateHours: null == kateHours
          ? _value._kateHours
          : kateHours // ignore: cast_nullable_to_non_nullable
              as List<WorkTime>,
      iV: null == iV
          ? _value.iV
          : iV // ignore: cast_nullable_to_non_nullable
              as int,
      ended: null == ended
          ? _value.ended
          : ended // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OutfitDto with DiagnosticableTreeMixin implements _OutfitDto {
  const _$_OutfitDto(
      {@JsonKey(name: '_id') required this.sId,
      required this.title,
      required this.hour,
      required this.date,
      required final List<WorkTime> momHours,
      required final List<WorkTime> kateHours,
      @JsonKey(name: '__v') required this.iV,
      required this.ended})
      : _momHours = momHours,
        _kateHours = kateHours;

  factory _$_OutfitDto.fromJson(Map<String, dynamic> json) =>
      _$$_OutfitDtoFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String sId;
  @override
  final String title;
  @override
  final String hour;
  @override
  final String date;
  final List<WorkTime> _momHours;
  @override
  List<WorkTime> get momHours {
    if (_momHours is EqualUnmodifiableListView) return _momHours;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_momHours);
  }

  final List<WorkTime> _kateHours;
  @override
  List<WorkTime> get kateHours {
    if (_kateHours is EqualUnmodifiableListView) return _kateHours;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_kateHours);
  }

  @override
  @JsonKey(name: '__v')
  final int iV;
  @override
  final bool ended;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OutfitDto(sId: $sId, title: $title, hour: $hour, date: $date, momHours: $momHours, kateHours: $kateHours, iV: $iV, ended: $ended)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OutfitDto'))
      ..add(DiagnosticsProperty('sId', sId))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('hour', hour))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('momHours', momHours))
      ..add(DiagnosticsProperty('kateHours', kateHours))
      ..add(DiagnosticsProperty('iV', iV))
      ..add(DiagnosticsProperty('ended', ended));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OutfitDto &&
            (identical(other.sId, sId) || other.sId == sId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._momHours, _momHours) &&
            const DeepCollectionEquality()
                .equals(other._kateHours, _kateHours) &&
            (identical(other.iV, iV) || other.iV == iV) &&
            (identical(other.ended, ended) || other.ended == ended));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sId,
      title,
      hour,
      date,
      const DeepCollectionEquality().hash(_momHours),
      const DeepCollectionEquality().hash(_kateHours),
      iV,
      ended);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OutfitDtoCopyWith<_$_OutfitDto> get copyWith =>
      __$$_OutfitDtoCopyWithImpl<_$_OutfitDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OutfitDtoToJson(
      this,
    );
  }
}

abstract class _OutfitDto implements OutfitDto {
  const factory _OutfitDto(
      {@JsonKey(name: '_id') required final String sId,
      required final String title,
      required final String hour,
      required final String date,
      required final List<WorkTime> momHours,
      required final List<WorkTime> kateHours,
      @JsonKey(name: '__v') required final int iV,
      required final bool ended}) = _$_OutfitDto;

  factory _OutfitDto.fromJson(Map<String, dynamic> json) =
      _$_OutfitDto.fromJson;

  @override
  @JsonKey(name: '_id')
  String get sId;
  @override
  String get title;
  @override
  String get hour;
  @override
  String get date;
  @override
  List<WorkTime> get momHours;
  @override
  List<WorkTime> get kateHours;
  @override
  @JsonKey(name: '__v')
  int get iV;
  @override
  bool get ended;
  @override
  @JsonKey(ignore: true)
  _$$_OutfitDtoCopyWith<_$_OutfitDto> get copyWith =>
      throw _privateConstructorUsedError;
}
