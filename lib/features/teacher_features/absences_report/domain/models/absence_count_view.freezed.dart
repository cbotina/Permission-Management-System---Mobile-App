// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'absence_count_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AbsenceCountView {
  int get absences => throw _privateConstructorUsedError;
  int get studentId => throw _privateConstructorUsedError;
  int get subjectGroupId => throw _privateConstructorUsedError;
  String get student => throw _privateConstructorUsedError;
  Gender get studentGender => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AbsenceCountViewCopyWith<AbsenceCountView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AbsenceCountViewCopyWith<$Res> {
  factory $AbsenceCountViewCopyWith(
          AbsenceCountView value, $Res Function(AbsenceCountView) then) =
      _$AbsenceCountViewCopyWithImpl<$Res, AbsenceCountView>;
  @useResult
  $Res call(
      {int absences,
      int studentId,
      int subjectGroupId,
      String student,
      Gender studentGender});
}

/// @nodoc
class _$AbsenceCountViewCopyWithImpl<$Res, $Val extends AbsenceCountView>
    implements $AbsenceCountViewCopyWith<$Res> {
  _$AbsenceCountViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? absences = null,
    Object? studentId = null,
    Object? subjectGroupId = null,
    Object? student = null,
    Object? studentGender = null,
  }) {
    return _then(_value.copyWith(
      absences: null == absences
          ? _value.absences
          : absences // ignore: cast_nullable_to_non_nullable
              as int,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int,
      subjectGroupId: null == subjectGroupId
          ? _value.subjectGroupId
          : subjectGroupId // ignore: cast_nullable_to_non_nullable
              as int,
      student: null == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as String,
      studentGender: null == studentGender
          ? _value.studentGender
          : studentGender // ignore: cast_nullable_to_non_nullable
              as Gender,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AbsenceCountViewImplCopyWith<$Res>
    implements $AbsenceCountViewCopyWith<$Res> {
  factory _$$AbsenceCountViewImplCopyWith(_$AbsenceCountViewImpl value,
          $Res Function(_$AbsenceCountViewImpl) then) =
      __$$AbsenceCountViewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int absences,
      int studentId,
      int subjectGroupId,
      String student,
      Gender studentGender});
}

/// @nodoc
class __$$AbsenceCountViewImplCopyWithImpl<$Res>
    extends _$AbsenceCountViewCopyWithImpl<$Res, _$AbsenceCountViewImpl>
    implements _$$AbsenceCountViewImplCopyWith<$Res> {
  __$$AbsenceCountViewImplCopyWithImpl(_$AbsenceCountViewImpl _value,
      $Res Function(_$AbsenceCountViewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? absences = null,
    Object? studentId = null,
    Object? subjectGroupId = null,
    Object? student = null,
    Object? studentGender = null,
  }) {
    return _then(_$AbsenceCountViewImpl(
      absences: null == absences
          ? _value.absences
          : absences // ignore: cast_nullable_to_non_nullable
              as int,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int,
      subjectGroupId: null == subjectGroupId
          ? _value.subjectGroupId
          : subjectGroupId // ignore: cast_nullable_to_non_nullable
              as int,
      student: null == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as String,
      studentGender: null == studentGender
          ? _value.studentGender
          : studentGender // ignore: cast_nullable_to_non_nullable
              as Gender,
    ));
  }
}

/// @nodoc

class _$AbsenceCountViewImpl implements _AbsenceCountView {
  const _$AbsenceCountViewImpl(
      {required this.absences,
      required this.studentId,
      required this.subjectGroupId,
      required this.student,
      required this.studentGender});

  @override
  final int absences;
  @override
  final int studentId;
  @override
  final int subjectGroupId;
  @override
  final String student;
  @override
  final Gender studentGender;

  @override
  String toString() {
    return 'AbsenceCountView(absences: $absences, studentId: $studentId, subjectGroupId: $subjectGroupId, student: $student, studentGender: $studentGender)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AbsenceCountViewImpl &&
            (identical(other.absences, absences) ||
                other.absences == absences) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.subjectGroupId, subjectGroupId) ||
                other.subjectGroupId == subjectGroupId) &&
            (identical(other.student, student) || other.student == student) &&
            (identical(other.studentGender, studentGender) ||
                other.studentGender == studentGender));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, absences, studentId, subjectGroupId, student, studentGender);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AbsenceCountViewImplCopyWith<_$AbsenceCountViewImpl> get copyWith =>
      __$$AbsenceCountViewImplCopyWithImpl<_$AbsenceCountViewImpl>(
          this, _$identity);
}

abstract class _AbsenceCountView implements AbsenceCountView {
  const factory _AbsenceCountView(
      {required final int absences,
      required final int studentId,
      required final int subjectGroupId,
      required final String student,
      required final Gender studentGender}) = _$AbsenceCountViewImpl;

  @override
  int get absences;
  @override
  int get studentId;
  @override
  int get subjectGroupId;
  @override
  String get student;
  @override
  Gender get studentGender;
  @override
  @JsonKey(ignore: true)
  _$$AbsenceCountViewImplCopyWith<_$AbsenceCountViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
