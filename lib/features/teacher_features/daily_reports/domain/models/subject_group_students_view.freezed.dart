// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subject_group_students_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubjectGroupStudentsView _$SubjectGroupStudentsViewFromJson(
    Map<String, dynamic> json) {
  return _SubjectGroupStudentsView.fromJson(json);
}

/// @nodoc
mixin _$SubjectGroupStudentsView {
  int get studentId => throw _privateConstructorUsedError;
  String get studentFirstName => throw _privateConstructorUsedError;
  String get studentLastName => throw _privateConstructorUsedError;
  Gender get studentGender => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubjectGroupStudentsViewCopyWith<SubjectGroupStudentsView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectGroupStudentsViewCopyWith<$Res> {
  factory $SubjectGroupStudentsViewCopyWith(SubjectGroupStudentsView value,
          $Res Function(SubjectGroupStudentsView) then) =
      _$SubjectGroupStudentsViewCopyWithImpl<$Res, SubjectGroupStudentsView>;
  @useResult
  $Res call(
      {int studentId,
      String studentFirstName,
      String studentLastName,
      Gender studentGender});
}

/// @nodoc
class _$SubjectGroupStudentsViewCopyWithImpl<$Res,
        $Val extends SubjectGroupStudentsView>
    implements $SubjectGroupStudentsViewCopyWith<$Res> {
  _$SubjectGroupStudentsViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentId = null,
    Object? studentFirstName = null,
    Object? studentLastName = null,
    Object? studentGender = null,
  }) {
    return _then(_value.copyWith(
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int,
      studentFirstName: null == studentFirstName
          ? _value.studentFirstName
          : studentFirstName // ignore: cast_nullable_to_non_nullable
              as String,
      studentLastName: null == studentLastName
          ? _value.studentLastName
          : studentLastName // ignore: cast_nullable_to_non_nullable
              as String,
      studentGender: null == studentGender
          ? _value.studentGender
          : studentGender // ignore: cast_nullable_to_non_nullable
              as Gender,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubjectGroupStudentsViewImplCopyWith<$Res>
    implements $SubjectGroupStudentsViewCopyWith<$Res> {
  factory _$$SubjectGroupStudentsViewImplCopyWith(
          _$SubjectGroupStudentsViewImpl value,
          $Res Function(_$SubjectGroupStudentsViewImpl) then) =
      __$$SubjectGroupStudentsViewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int studentId,
      String studentFirstName,
      String studentLastName,
      Gender studentGender});
}

/// @nodoc
class __$$SubjectGroupStudentsViewImplCopyWithImpl<$Res>
    extends _$SubjectGroupStudentsViewCopyWithImpl<$Res,
        _$SubjectGroupStudentsViewImpl>
    implements _$$SubjectGroupStudentsViewImplCopyWith<$Res> {
  __$$SubjectGroupStudentsViewImplCopyWithImpl(
      _$SubjectGroupStudentsViewImpl _value,
      $Res Function(_$SubjectGroupStudentsViewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentId = null,
    Object? studentFirstName = null,
    Object? studentLastName = null,
    Object? studentGender = null,
  }) {
    return _then(_$SubjectGroupStudentsViewImpl(
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int,
      studentFirstName: null == studentFirstName
          ? _value.studentFirstName
          : studentFirstName // ignore: cast_nullable_to_non_nullable
              as String,
      studentLastName: null == studentLastName
          ? _value.studentLastName
          : studentLastName // ignore: cast_nullable_to_non_nullable
              as String,
      studentGender: null == studentGender
          ? _value.studentGender
          : studentGender // ignore: cast_nullable_to_non_nullable
              as Gender,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubjectGroupStudentsViewImpl implements _SubjectGroupStudentsView {
  const _$SubjectGroupStudentsViewImpl(
      {required this.studentId,
      required this.studentFirstName,
      required this.studentLastName,
      required this.studentGender});

  factory _$SubjectGroupStudentsViewImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubjectGroupStudentsViewImplFromJson(json);

  @override
  final int studentId;
  @override
  final String studentFirstName;
  @override
  final String studentLastName;
  @override
  final Gender studentGender;

  @override
  String toString() {
    return 'SubjectGroupStudentsView(studentId: $studentId, studentFirstName: $studentFirstName, studentLastName: $studentLastName, studentGender: $studentGender)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubjectGroupStudentsViewImpl &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.studentFirstName, studentFirstName) ||
                other.studentFirstName == studentFirstName) &&
            (identical(other.studentLastName, studentLastName) ||
                other.studentLastName == studentLastName) &&
            (identical(other.studentGender, studentGender) ||
                other.studentGender == studentGender));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, studentId, studentFirstName, studentLastName, studentGender);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubjectGroupStudentsViewImplCopyWith<_$SubjectGroupStudentsViewImpl>
      get copyWith => __$$SubjectGroupStudentsViewImplCopyWithImpl<
          _$SubjectGroupStudentsViewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubjectGroupStudentsViewImplToJson(
      this,
    );
  }
}

abstract class _SubjectGroupStudentsView implements SubjectGroupStudentsView {
  const factory _SubjectGroupStudentsView(
      {required final int studentId,
      required final String studentFirstName,
      required final String studentLastName,
      required final Gender studentGender}) = _$SubjectGroupStudentsViewImpl;

  factory _SubjectGroupStudentsView.fromJson(Map<String, dynamic> json) =
      _$SubjectGroupStudentsViewImpl.fromJson;

  @override
  int get studentId;
  @override
  String get studentFirstName;
  @override
  String get studentLastName;
  @override
  Gender get studentGender;
  @override
  @JsonKey(ignore: true)
  _$$SubjectGroupStudentsViewImplCopyWith<_$SubjectGroupStudentsViewImpl>
      get copyWith => throw _privateConstructorUsedError;
}
