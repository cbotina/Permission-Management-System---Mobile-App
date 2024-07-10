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
  String get student => throw _privateConstructorUsedError;

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
  $Res call({int absences, String student});
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
    Object? student = null,
  }) {
    return _then(_value.copyWith(
      absences: null == absences
          ? _value.absences
          : absences // ignore: cast_nullable_to_non_nullable
              as int,
      student: null == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as String,
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
  $Res call({int absences, String student});
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
    Object? student = null,
  }) {
    return _then(_$AbsenceCountViewImpl(
      absences: null == absences
          ? _value.absences
          : absences // ignore: cast_nullable_to_non_nullable
              as int,
      student: null == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AbsenceCountViewImpl implements _AbsenceCountView {
  const _$AbsenceCountViewImpl({required this.absences, required this.student});

  @override
  final int absences;
  @override
  final String student;

  @override
  String toString() {
    return 'AbsenceCountView(absences: $absences, student: $student)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AbsenceCountViewImpl &&
            (identical(other.absences, absences) ||
                other.absences == absences) &&
            (identical(other.student, student) || other.student == student));
  }

  @override
  int get hashCode => Object.hash(runtimeType, absences, student);

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
      required final String student}) = _$AbsenceCountViewImpl;

  @override
  int get absences;
  @override
  String get student;
  @override
  @JsonKey(ignore: true)
  _$$AbsenceCountViewImplCopyWith<_$AbsenceCountViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
