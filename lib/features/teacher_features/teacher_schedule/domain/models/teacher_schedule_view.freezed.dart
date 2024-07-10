// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teacher_schedule_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TeacherScheduleView {
  int get subjectGroupTimeSlotId => throw _privateConstructorUsedError;
  TimeOfDay get startTime => throw _privateConstructorUsedError;
  TimeOfDay get endTime => throw _privateConstructorUsedError;
  int get subjectGroupId => throw _privateConstructorUsedError;
  String get groupName => throw _privateConstructorUsedError;
  String get subjectName => throw _privateConstructorUsedError;
  String get day => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TeacherScheduleViewCopyWith<TeacherScheduleView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherScheduleViewCopyWith<$Res> {
  factory $TeacherScheduleViewCopyWith(
          TeacherScheduleView value, $Res Function(TeacherScheduleView) then) =
      _$TeacherScheduleViewCopyWithImpl<$Res, TeacherScheduleView>;
  @useResult
  $Res call(
      {int subjectGroupTimeSlotId,
      TimeOfDay startTime,
      TimeOfDay endTime,
      int subjectGroupId,
      String groupName,
      String subjectName,
      String day});
}

/// @nodoc
class _$TeacherScheduleViewCopyWithImpl<$Res, $Val extends TeacherScheduleView>
    implements $TeacherScheduleViewCopyWith<$Res> {
  _$TeacherScheduleViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectGroupTimeSlotId = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? subjectGroupId = null,
    Object? groupName = null,
    Object? subjectName = null,
    Object? day = null,
  }) {
    return _then(_value.copyWith(
      subjectGroupTimeSlotId: null == subjectGroupTimeSlotId
          ? _value.subjectGroupTimeSlotId
          : subjectGroupTimeSlotId // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      subjectGroupId: null == subjectGroupId
          ? _value.subjectGroupId
          : subjectGroupId // ignore: cast_nullable_to_non_nullable
              as int,
      groupName: null == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
      subjectName: null == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TeacherScheduleViewImplCopyWith<$Res>
    implements $TeacherScheduleViewCopyWith<$Res> {
  factory _$$TeacherScheduleViewImplCopyWith(_$TeacherScheduleViewImpl value,
          $Res Function(_$TeacherScheduleViewImpl) then) =
      __$$TeacherScheduleViewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int subjectGroupTimeSlotId,
      TimeOfDay startTime,
      TimeOfDay endTime,
      int subjectGroupId,
      String groupName,
      String subjectName,
      String day});
}

/// @nodoc
class __$$TeacherScheduleViewImplCopyWithImpl<$Res>
    extends _$TeacherScheduleViewCopyWithImpl<$Res, _$TeacherScheduleViewImpl>
    implements _$$TeacherScheduleViewImplCopyWith<$Res> {
  __$$TeacherScheduleViewImplCopyWithImpl(_$TeacherScheduleViewImpl _value,
      $Res Function(_$TeacherScheduleViewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectGroupTimeSlotId = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? subjectGroupId = null,
    Object? groupName = null,
    Object? subjectName = null,
    Object? day = null,
  }) {
    return _then(_$TeacherScheduleViewImpl(
      subjectGroupTimeSlotId: null == subjectGroupTimeSlotId
          ? _value.subjectGroupTimeSlotId
          : subjectGroupTimeSlotId // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      subjectGroupId: null == subjectGroupId
          ? _value.subjectGroupId
          : subjectGroupId // ignore: cast_nullable_to_non_nullable
              as int,
      groupName: null == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
      subjectName: null == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TeacherScheduleViewImpl implements _TeacherScheduleView {
  const _$TeacherScheduleViewImpl(
      {required this.subjectGroupTimeSlotId,
      required this.startTime,
      required this.endTime,
      required this.subjectGroupId,
      required this.groupName,
      required this.subjectName,
      required this.day});

  @override
  final int subjectGroupTimeSlotId;
  @override
  final TimeOfDay startTime;
  @override
  final TimeOfDay endTime;
  @override
  final int subjectGroupId;
  @override
  final String groupName;
  @override
  final String subjectName;
  @override
  final String day;

  @override
  String toString() {
    return 'TeacherScheduleView(subjectGroupTimeSlotId: $subjectGroupTimeSlotId, startTime: $startTime, endTime: $endTime, subjectGroupId: $subjectGroupId, groupName: $groupName, subjectName: $subjectName, day: $day)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeacherScheduleViewImpl &&
            (identical(other.subjectGroupTimeSlotId, subjectGroupTimeSlotId) ||
                other.subjectGroupTimeSlotId == subjectGroupTimeSlotId) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.subjectGroupId, subjectGroupId) ||
                other.subjectGroupId == subjectGroupId) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.subjectName, subjectName) ||
                other.subjectName == subjectName) &&
            (identical(other.day, day) || other.day == day));
  }

  @override
  int get hashCode => Object.hash(runtimeType, subjectGroupTimeSlotId,
      startTime, endTime, subjectGroupId, groupName, subjectName, day);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TeacherScheduleViewImplCopyWith<_$TeacherScheduleViewImpl> get copyWith =>
      __$$TeacherScheduleViewImplCopyWithImpl<_$TeacherScheduleViewImpl>(
          this, _$identity);
}

abstract class _TeacherScheduleView implements TeacherScheduleView {
  const factory _TeacherScheduleView(
      {required final int subjectGroupTimeSlotId,
      required final TimeOfDay startTime,
      required final TimeOfDay endTime,
      required final int subjectGroupId,
      required final String groupName,
      required final String subjectName,
      required final String day}) = _$TeacherScheduleViewImpl;

  @override
  int get subjectGroupTimeSlotId;
  @override
  TimeOfDay get startTime;
  @override
  TimeOfDay get endTime;
  @override
  int get subjectGroupId;
  @override
  String get groupName;
  @override
  String get subjectName;
  @override
  String get day;
  @override
  @JsonKey(ignore: true)
  _$$TeacherScheduleViewImplCopyWith<_$TeacherScheduleViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
