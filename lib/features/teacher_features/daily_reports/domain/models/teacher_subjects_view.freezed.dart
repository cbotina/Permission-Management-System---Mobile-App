// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teacher_subjects_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TeacherSubjectsView _$TeacherSubjectsViewFromJson(Map<String, dynamic> json) {
  return _TeacherSubjectsView.fromJson(json);
}

/// @nodoc
mixin _$TeacherSubjectsView {
  int get subjectGroupId => throw _privateConstructorUsedError;
  String get subjectName => throw _privateConstructorUsedError;
  String get groupName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeacherSubjectsViewCopyWith<TeacherSubjectsView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherSubjectsViewCopyWith<$Res> {
  factory $TeacherSubjectsViewCopyWith(
          TeacherSubjectsView value, $Res Function(TeacherSubjectsView) then) =
      _$TeacherSubjectsViewCopyWithImpl<$Res, TeacherSubjectsView>;
  @useResult
  $Res call({int subjectGroupId, String subjectName, String groupName});
}

/// @nodoc
class _$TeacherSubjectsViewCopyWithImpl<$Res, $Val extends TeacherSubjectsView>
    implements $TeacherSubjectsViewCopyWith<$Res> {
  _$TeacherSubjectsViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectGroupId = null,
    Object? subjectName = null,
    Object? groupName = null,
  }) {
    return _then(_value.copyWith(
      subjectGroupId: null == subjectGroupId
          ? _value.subjectGroupId
          : subjectGroupId // ignore: cast_nullable_to_non_nullable
              as int,
      subjectName: null == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String,
      groupName: null == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TeacherSubjectsViewImplCopyWith<$Res>
    implements $TeacherSubjectsViewCopyWith<$Res> {
  factory _$$TeacherSubjectsViewImplCopyWith(_$TeacherSubjectsViewImpl value,
          $Res Function(_$TeacherSubjectsViewImpl) then) =
      __$$TeacherSubjectsViewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int subjectGroupId, String subjectName, String groupName});
}

/// @nodoc
class __$$TeacherSubjectsViewImplCopyWithImpl<$Res>
    extends _$TeacherSubjectsViewCopyWithImpl<$Res, _$TeacherSubjectsViewImpl>
    implements _$$TeacherSubjectsViewImplCopyWith<$Res> {
  __$$TeacherSubjectsViewImplCopyWithImpl(_$TeacherSubjectsViewImpl _value,
      $Res Function(_$TeacherSubjectsViewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectGroupId = null,
    Object? subjectName = null,
    Object? groupName = null,
  }) {
    return _then(_$TeacherSubjectsViewImpl(
      subjectGroupId: null == subjectGroupId
          ? _value.subjectGroupId
          : subjectGroupId // ignore: cast_nullable_to_non_nullable
              as int,
      subjectName: null == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String,
      groupName: null == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TeacherSubjectsViewImpl implements _TeacherSubjectsView {
  const _$TeacherSubjectsViewImpl(
      {required this.subjectGroupId,
      required this.subjectName,
      required this.groupName});

  factory _$TeacherSubjectsViewImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeacherSubjectsViewImplFromJson(json);

  @override
  final int subjectGroupId;
  @override
  final String subjectName;
  @override
  final String groupName;

  @override
  String toString() {
    return 'TeacherSubjectsView(subjectGroupId: $subjectGroupId, subjectName: $subjectName, groupName: $groupName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeacherSubjectsViewImpl &&
            (identical(other.subjectGroupId, subjectGroupId) ||
                other.subjectGroupId == subjectGroupId) &&
            (identical(other.subjectName, subjectName) ||
                other.subjectName == subjectName) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, subjectGroupId, subjectName, groupName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TeacherSubjectsViewImplCopyWith<_$TeacherSubjectsViewImpl> get copyWith =>
      __$$TeacherSubjectsViewImplCopyWithImpl<_$TeacherSubjectsViewImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeacherSubjectsViewImplToJson(
      this,
    );
  }
}

abstract class _TeacherSubjectsView implements TeacherSubjectsView {
  const factory _TeacherSubjectsView(
      {required final int subjectGroupId,
      required final String subjectName,
      required final String groupName}) = _$TeacherSubjectsViewImpl;

  factory _TeacherSubjectsView.fromJson(Map<String, dynamic> json) =
      _$TeacherSubjectsViewImpl.fromJson;

  @override
  int get subjectGroupId;
  @override
  String get subjectName;
  @override
  String get groupName;
  @override
  @JsonKey(ignore: true)
  _$$TeacherSubjectsViewImplCopyWith<_$TeacherSubjectsViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
