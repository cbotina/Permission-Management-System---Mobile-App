// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_enrollment_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StudentEnrollmentView _$StudentEnrollmentViewFromJson(
    Map<String, dynamic> json) {
  return _StudentEnrollmentView.fromJson(json);
}

/// @nodoc
mixin _$StudentEnrollmentView {
  int get enrollmentId => throw _privateConstructorUsedError;
  String get subjectName => throw _privateConstructorUsedError;
  String get teacherName => throw _privateConstructorUsedError;
  int get periodId => throw _privateConstructorUsedError;
  int get studentId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StudentEnrollmentViewCopyWith<StudentEnrollmentView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentEnrollmentViewCopyWith<$Res> {
  factory $StudentEnrollmentViewCopyWith(StudentEnrollmentView value,
          $Res Function(StudentEnrollmentView) then) =
      _$StudentEnrollmentViewCopyWithImpl<$Res, StudentEnrollmentView>;
  @useResult
  $Res call(
      {int enrollmentId,
      String subjectName,
      String teacherName,
      int periodId,
      int studentId});
}

/// @nodoc
class _$StudentEnrollmentViewCopyWithImpl<$Res,
        $Val extends StudentEnrollmentView>
    implements $StudentEnrollmentViewCopyWith<$Res> {
  _$StudentEnrollmentViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enrollmentId = null,
    Object? subjectName = null,
    Object? teacherName = null,
    Object? periodId = null,
    Object? studentId = null,
  }) {
    return _then(_value.copyWith(
      enrollmentId: null == enrollmentId
          ? _value.enrollmentId
          : enrollmentId // ignore: cast_nullable_to_non_nullable
              as int,
      subjectName: null == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String,
      teacherName: null == teacherName
          ? _value.teacherName
          : teacherName // ignore: cast_nullable_to_non_nullable
              as String,
      periodId: null == periodId
          ? _value.periodId
          : periodId // ignore: cast_nullable_to_non_nullable
              as int,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudentEnrollmentViewImplCopyWith<$Res>
    implements $StudentEnrollmentViewCopyWith<$Res> {
  factory _$$StudentEnrollmentViewImplCopyWith(
          _$StudentEnrollmentViewImpl value,
          $Res Function(_$StudentEnrollmentViewImpl) then) =
      __$$StudentEnrollmentViewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int enrollmentId,
      String subjectName,
      String teacherName,
      int periodId,
      int studentId});
}

/// @nodoc
class __$$StudentEnrollmentViewImplCopyWithImpl<$Res>
    extends _$StudentEnrollmentViewCopyWithImpl<$Res,
        _$StudentEnrollmentViewImpl>
    implements _$$StudentEnrollmentViewImplCopyWith<$Res> {
  __$$StudentEnrollmentViewImplCopyWithImpl(_$StudentEnrollmentViewImpl _value,
      $Res Function(_$StudentEnrollmentViewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enrollmentId = null,
    Object? subjectName = null,
    Object? teacherName = null,
    Object? periodId = null,
    Object? studentId = null,
  }) {
    return _then(_$StudentEnrollmentViewImpl(
      enrollmentId: null == enrollmentId
          ? _value.enrollmentId
          : enrollmentId // ignore: cast_nullable_to_non_nullable
              as int,
      subjectName: null == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String,
      teacherName: null == teacherName
          ? _value.teacherName
          : teacherName // ignore: cast_nullable_to_non_nullable
              as String,
      periodId: null == periodId
          ? _value.periodId
          : periodId // ignore: cast_nullable_to_non_nullable
              as int,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StudentEnrollmentViewImpl implements _StudentEnrollmentView {
  const _$StudentEnrollmentViewImpl(
      {required this.enrollmentId,
      required this.subjectName,
      required this.teacherName,
      required this.periodId,
      required this.studentId});

  factory _$StudentEnrollmentViewImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentEnrollmentViewImplFromJson(json);

  @override
  final int enrollmentId;
  @override
  final String subjectName;
  @override
  final String teacherName;
  @override
  final int periodId;
  @override
  final int studentId;

  @override
  String toString() {
    return 'StudentEnrollmentView(enrollmentId: $enrollmentId, subjectName: $subjectName, teacherName: $teacherName, periodId: $periodId, studentId: $studentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentEnrollmentViewImpl &&
            (identical(other.enrollmentId, enrollmentId) ||
                other.enrollmentId == enrollmentId) &&
            (identical(other.subjectName, subjectName) ||
                other.subjectName == subjectName) &&
            (identical(other.teacherName, teacherName) ||
                other.teacherName == teacherName) &&
            (identical(other.periodId, periodId) ||
                other.periodId == periodId) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, enrollmentId, subjectName, teacherName, periodId, studentId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentEnrollmentViewImplCopyWith<_$StudentEnrollmentViewImpl>
      get copyWith => __$$StudentEnrollmentViewImplCopyWithImpl<
          _$StudentEnrollmentViewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentEnrollmentViewImplToJson(
      this,
    );
  }
}

abstract class _StudentEnrollmentView implements StudentEnrollmentView {
  const factory _StudentEnrollmentView(
      {required final int enrollmentId,
      required final String subjectName,
      required final String teacherName,
      required final int periodId,
      required final int studentId}) = _$StudentEnrollmentViewImpl;

  factory _StudentEnrollmentView.fromJson(Map<String, dynamic> json) =
      _$StudentEnrollmentViewImpl.fromJson;

  @override
  int get enrollmentId;
  @override
  String get subjectName;
  @override
  String get teacherName;
  @override
  int get periodId;
  @override
  int get studentId;
  @override
  @JsonKey(ignore: true)
  _$$StudentEnrollmentViewImplCopyWith<_$StudentEnrollmentViewImpl>
      get copyWith => throw _privateConstructorUsedError;
}
