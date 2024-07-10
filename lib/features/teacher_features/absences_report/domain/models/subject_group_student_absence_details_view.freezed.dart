// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subject_group_student_absence_details_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SubjectGroupStudentAbsenceDetailsView {
  int get absenceId => throw _privateConstructorUsedError;
  DateTime get absenceDate => throw _privateConstructorUsedError;
  TimeOfDay get startTime => throw _privateConstructorUsedError;
  TimeOfDay get endTime => throw _privateConstructorUsedError;
  String? get teacherNote => throw _privateConstructorUsedError;
  String get permissionStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubjectGroupStudentAbsenceDetailsViewCopyWith<
          SubjectGroupStudentAbsenceDetailsView>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectGroupStudentAbsenceDetailsViewCopyWith<$Res> {
  factory $SubjectGroupStudentAbsenceDetailsViewCopyWith(
          SubjectGroupStudentAbsenceDetailsView value,
          $Res Function(SubjectGroupStudentAbsenceDetailsView) then) =
      _$SubjectGroupStudentAbsenceDetailsViewCopyWithImpl<$Res,
          SubjectGroupStudentAbsenceDetailsView>;
  @useResult
  $Res call(
      {int absenceId,
      DateTime absenceDate,
      TimeOfDay startTime,
      TimeOfDay endTime,
      String? teacherNote,
      String permissionStatus});
}

/// @nodoc
class _$SubjectGroupStudentAbsenceDetailsViewCopyWithImpl<$Res,
        $Val extends SubjectGroupStudentAbsenceDetailsView>
    implements $SubjectGroupStudentAbsenceDetailsViewCopyWith<$Res> {
  _$SubjectGroupStudentAbsenceDetailsViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? absenceId = null,
    Object? absenceDate = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? teacherNote = freezed,
    Object? permissionStatus = null,
  }) {
    return _then(_value.copyWith(
      absenceId: null == absenceId
          ? _value.absenceId
          : absenceId // ignore: cast_nullable_to_non_nullable
              as int,
      absenceDate: null == absenceDate
          ? _value.absenceDate
          : absenceDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      teacherNote: freezed == teacherNote
          ? _value.teacherNote
          : teacherNote // ignore: cast_nullable_to_non_nullable
              as String?,
      permissionStatus: null == permissionStatus
          ? _value.permissionStatus
          : permissionStatus // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubjectGroupStudentAbsenceDetailsViewImplCopyWith<$Res>
    implements $SubjectGroupStudentAbsenceDetailsViewCopyWith<$Res> {
  factory _$$SubjectGroupStudentAbsenceDetailsViewImplCopyWith(
          _$SubjectGroupStudentAbsenceDetailsViewImpl value,
          $Res Function(_$SubjectGroupStudentAbsenceDetailsViewImpl) then) =
      __$$SubjectGroupStudentAbsenceDetailsViewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int absenceId,
      DateTime absenceDate,
      TimeOfDay startTime,
      TimeOfDay endTime,
      String? teacherNote,
      String permissionStatus});
}

/// @nodoc
class __$$SubjectGroupStudentAbsenceDetailsViewImplCopyWithImpl<$Res>
    extends _$SubjectGroupStudentAbsenceDetailsViewCopyWithImpl<$Res,
        _$SubjectGroupStudentAbsenceDetailsViewImpl>
    implements _$$SubjectGroupStudentAbsenceDetailsViewImplCopyWith<$Res> {
  __$$SubjectGroupStudentAbsenceDetailsViewImplCopyWithImpl(
      _$SubjectGroupStudentAbsenceDetailsViewImpl _value,
      $Res Function(_$SubjectGroupStudentAbsenceDetailsViewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? absenceId = null,
    Object? absenceDate = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? teacherNote = freezed,
    Object? permissionStatus = null,
  }) {
    return _then(_$SubjectGroupStudentAbsenceDetailsViewImpl(
      absenceId: null == absenceId
          ? _value.absenceId
          : absenceId // ignore: cast_nullable_to_non_nullable
              as int,
      absenceDate: null == absenceDate
          ? _value.absenceDate
          : absenceDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      teacherNote: freezed == teacherNote
          ? _value.teacherNote
          : teacherNote // ignore: cast_nullable_to_non_nullable
              as String?,
      permissionStatus: null == permissionStatus
          ? _value.permissionStatus
          : permissionStatus // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SubjectGroupStudentAbsenceDetailsViewImpl
    implements _SubjectGroupStudentAbsenceDetailsView {
  const _$SubjectGroupStudentAbsenceDetailsViewImpl(
      {required this.absenceId,
      required this.absenceDate,
      required this.startTime,
      required this.endTime,
      required this.teacherNote,
      required this.permissionStatus});

  @override
  final int absenceId;
  @override
  final DateTime absenceDate;
  @override
  final TimeOfDay startTime;
  @override
  final TimeOfDay endTime;
  @override
  final String? teacherNote;
  @override
  final String permissionStatus;

  @override
  String toString() {
    return 'SubjectGroupStudentAbsenceDetailsView(absenceId: $absenceId, absenceDate: $absenceDate, startTime: $startTime, endTime: $endTime, teacherNote: $teacherNote, permissionStatus: $permissionStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubjectGroupStudentAbsenceDetailsViewImpl &&
            (identical(other.absenceId, absenceId) ||
                other.absenceId == absenceId) &&
            (identical(other.absenceDate, absenceDate) ||
                other.absenceDate == absenceDate) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.teacherNote, teacherNote) ||
                other.teacherNote == teacherNote) &&
            (identical(other.permissionStatus, permissionStatus) ||
                other.permissionStatus == permissionStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, absenceId, absenceDate,
      startTime, endTime, teacherNote, permissionStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubjectGroupStudentAbsenceDetailsViewImplCopyWith<
          _$SubjectGroupStudentAbsenceDetailsViewImpl>
      get copyWith => __$$SubjectGroupStudentAbsenceDetailsViewImplCopyWithImpl<
          _$SubjectGroupStudentAbsenceDetailsViewImpl>(this, _$identity);
}

abstract class _SubjectGroupStudentAbsenceDetailsView
    implements SubjectGroupStudentAbsenceDetailsView {
  const factory _SubjectGroupStudentAbsenceDetailsView(
          {required final int absenceId,
          required final DateTime absenceDate,
          required final TimeOfDay startTime,
          required final TimeOfDay endTime,
          required final String? teacherNote,
          required final String permissionStatus}) =
      _$SubjectGroupStudentAbsenceDetailsViewImpl;

  @override
  int get absenceId;
  @override
  DateTime get absenceDate;
  @override
  TimeOfDay get startTime;
  @override
  TimeOfDay get endTime;
  @override
  String? get teacherNote;
  @override
  String get permissionStatus;
  @override
  @JsonKey(ignore: true)
  _$$SubjectGroupStudentAbsenceDetailsViewImplCopyWith<
          _$SubjectGroupStudentAbsenceDetailsViewImpl>
      get copyWith => throw _privateConstructorUsedError;
}
