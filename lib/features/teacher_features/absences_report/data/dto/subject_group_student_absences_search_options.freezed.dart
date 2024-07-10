// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subject_group_student_absences_search_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SubjectGroupStudentAbsenceSearchOptions {
  int get studentId => throw _privateConstructorUsedError;
  int get subjectGroupId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubjectGroupStudentAbsenceSearchOptionsCopyWith<
          SubjectGroupStudentAbsenceSearchOptions>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectGroupStudentAbsenceSearchOptionsCopyWith<$Res> {
  factory $SubjectGroupStudentAbsenceSearchOptionsCopyWith(
          SubjectGroupStudentAbsenceSearchOptions value,
          $Res Function(SubjectGroupStudentAbsenceSearchOptions) then) =
      _$SubjectGroupStudentAbsenceSearchOptionsCopyWithImpl<$Res,
          SubjectGroupStudentAbsenceSearchOptions>;
  @useResult
  $Res call({int studentId, int subjectGroupId});
}

/// @nodoc
class _$SubjectGroupStudentAbsenceSearchOptionsCopyWithImpl<$Res,
        $Val extends SubjectGroupStudentAbsenceSearchOptions>
    implements $SubjectGroupStudentAbsenceSearchOptionsCopyWith<$Res> {
  _$SubjectGroupStudentAbsenceSearchOptionsCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentId = null,
    Object? subjectGroupId = null,
  }) {
    return _then(_value.copyWith(
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int,
      subjectGroupId: null == subjectGroupId
          ? _value.subjectGroupId
          : subjectGroupId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubjectGroupStudentAbsenceSearchOptionsImplCopyWith<$Res>
    implements $SubjectGroupStudentAbsenceSearchOptionsCopyWith<$Res> {
  factory _$$SubjectGroupStudentAbsenceSearchOptionsImplCopyWith(
          _$SubjectGroupStudentAbsenceSearchOptionsImpl value,
          $Res Function(_$SubjectGroupStudentAbsenceSearchOptionsImpl) then) =
      __$$SubjectGroupStudentAbsenceSearchOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int studentId, int subjectGroupId});
}

/// @nodoc
class __$$SubjectGroupStudentAbsenceSearchOptionsImplCopyWithImpl<$Res>
    extends _$SubjectGroupStudentAbsenceSearchOptionsCopyWithImpl<$Res,
        _$SubjectGroupStudentAbsenceSearchOptionsImpl>
    implements _$$SubjectGroupStudentAbsenceSearchOptionsImplCopyWith<$Res> {
  __$$SubjectGroupStudentAbsenceSearchOptionsImplCopyWithImpl(
      _$SubjectGroupStudentAbsenceSearchOptionsImpl _value,
      $Res Function(_$SubjectGroupStudentAbsenceSearchOptionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentId = null,
    Object? subjectGroupId = null,
  }) {
    return _then(_$SubjectGroupStudentAbsenceSearchOptionsImpl(
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int,
      subjectGroupId: null == subjectGroupId
          ? _value.subjectGroupId
          : subjectGroupId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SubjectGroupStudentAbsenceSearchOptionsImpl
    implements _SubjectGroupStudentAbsenceSearchOptions {
  const _$SubjectGroupStudentAbsenceSearchOptionsImpl(
      {required this.studentId, required this.subjectGroupId});

  @override
  final int studentId;
  @override
  final int subjectGroupId;

  @override
  String toString() {
    return 'SubjectGroupStudentAbsenceSearchOptions(studentId: $studentId, subjectGroupId: $subjectGroupId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubjectGroupStudentAbsenceSearchOptionsImpl &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.subjectGroupId, subjectGroupId) ||
                other.subjectGroupId == subjectGroupId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, studentId, subjectGroupId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubjectGroupStudentAbsenceSearchOptionsImplCopyWith<
          _$SubjectGroupStudentAbsenceSearchOptionsImpl>
      get copyWith =>
          __$$SubjectGroupStudentAbsenceSearchOptionsImplCopyWithImpl<
              _$SubjectGroupStudentAbsenceSearchOptionsImpl>(this, _$identity);
}

abstract class _SubjectGroupStudentAbsenceSearchOptions
    implements SubjectGroupStudentAbsenceSearchOptions {
  const factory _SubjectGroupStudentAbsenceSearchOptions(
          {required final int studentId, required final int subjectGroupId}) =
      _$SubjectGroupStudentAbsenceSearchOptionsImpl;

  @override
  int get studentId;
  @override
  int get subjectGroupId;
  @override
  @JsonKey(ignore: true)
  _$$SubjectGroupStudentAbsenceSearchOptionsImplCopyWith<
          _$SubjectGroupStudentAbsenceSearchOptionsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
