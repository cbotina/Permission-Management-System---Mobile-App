// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'justify_absences_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$JustifyAbsencesInfo {
  String get reason => throw _privateConstructorUsedError;
  Uint8List get fileBytes => throw _privateConstructorUsedError;
  String get fileExtension => throw _privateConstructorUsedError;
  String? get studentNote => throw _privateConstructorUsedError;
  List<int> get absencesIds => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $JustifyAbsencesInfoCopyWith<JustifyAbsencesInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JustifyAbsencesInfoCopyWith<$Res> {
  factory $JustifyAbsencesInfoCopyWith(
          JustifyAbsencesInfo value, $Res Function(JustifyAbsencesInfo) then) =
      _$JustifyAbsencesInfoCopyWithImpl<$Res, JustifyAbsencesInfo>;
  @useResult
  $Res call(
      {String reason,
      Uint8List fileBytes,
      String fileExtension,
      String? studentNote,
      List<int> absencesIds});
}

/// @nodoc
class _$JustifyAbsencesInfoCopyWithImpl<$Res, $Val extends JustifyAbsencesInfo>
    implements $JustifyAbsencesInfoCopyWith<$Res> {
  _$JustifyAbsencesInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = null,
    Object? fileBytes = null,
    Object? fileExtension = null,
    Object? studentNote = freezed,
    Object? absencesIds = null,
  }) {
    return _then(_value.copyWith(
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      fileBytes: null == fileBytes
          ? _value.fileBytes
          : fileBytes // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      fileExtension: null == fileExtension
          ? _value.fileExtension
          : fileExtension // ignore: cast_nullable_to_non_nullable
              as String,
      studentNote: freezed == studentNote
          ? _value.studentNote
          : studentNote // ignore: cast_nullable_to_non_nullable
              as String?,
      absencesIds: null == absencesIds
          ? _value.absencesIds
          : absencesIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JustifyAbsencesInfoImplCopyWith<$Res>
    implements $JustifyAbsencesInfoCopyWith<$Res> {
  factory _$$JustifyAbsencesInfoImplCopyWith(_$JustifyAbsencesInfoImpl value,
          $Res Function(_$JustifyAbsencesInfoImpl) then) =
      __$$JustifyAbsencesInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String reason,
      Uint8List fileBytes,
      String fileExtension,
      String? studentNote,
      List<int> absencesIds});
}

/// @nodoc
class __$$JustifyAbsencesInfoImplCopyWithImpl<$Res>
    extends _$JustifyAbsencesInfoCopyWithImpl<$Res, _$JustifyAbsencesInfoImpl>
    implements _$$JustifyAbsencesInfoImplCopyWith<$Res> {
  __$$JustifyAbsencesInfoImplCopyWithImpl(_$JustifyAbsencesInfoImpl _value,
      $Res Function(_$JustifyAbsencesInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = null,
    Object? fileBytes = null,
    Object? fileExtension = null,
    Object? studentNote = freezed,
    Object? absencesIds = null,
  }) {
    return _then(_$JustifyAbsencesInfoImpl(
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      fileBytes: null == fileBytes
          ? _value.fileBytes
          : fileBytes // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      fileExtension: null == fileExtension
          ? _value.fileExtension
          : fileExtension // ignore: cast_nullable_to_non_nullable
              as String,
      studentNote: freezed == studentNote
          ? _value.studentNote
          : studentNote // ignore: cast_nullable_to_non_nullable
              as String?,
      absencesIds: null == absencesIds
          ? _value._absencesIds
          : absencesIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$JustifyAbsencesInfoImpl
    with DiagnosticableTreeMixin
    implements _JustifyAbsencesInfo {
  const _$JustifyAbsencesInfoImpl(
      {required this.reason,
      required this.fileBytes,
      required this.fileExtension,
      required this.studentNote,
      required final List<int> absencesIds})
      : _absencesIds = absencesIds;

  @override
  final String reason;
  @override
  final Uint8List fileBytes;
  @override
  final String fileExtension;
  @override
  final String? studentNote;
  final List<int> _absencesIds;
  @override
  List<int> get absencesIds {
    if (_absencesIds is EqualUnmodifiableListView) return _absencesIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_absencesIds);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'JustifyAbsencesInfo(reason: $reason, fileBytes: $fileBytes, fileExtension: $fileExtension, studentNote: $studentNote, absencesIds: $absencesIds)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'JustifyAbsencesInfo'))
      ..add(DiagnosticsProperty('reason', reason))
      ..add(DiagnosticsProperty('fileBytes', fileBytes))
      ..add(DiagnosticsProperty('fileExtension', fileExtension))
      ..add(DiagnosticsProperty('studentNote', studentNote))
      ..add(DiagnosticsProperty('absencesIds', absencesIds));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JustifyAbsencesInfoImpl &&
            (identical(other.reason, reason) || other.reason == reason) &&
            const DeepCollectionEquality().equals(other.fileBytes, fileBytes) &&
            (identical(other.fileExtension, fileExtension) ||
                other.fileExtension == fileExtension) &&
            (identical(other.studentNote, studentNote) ||
                other.studentNote == studentNote) &&
            const DeepCollectionEquality()
                .equals(other._absencesIds, _absencesIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      reason,
      const DeepCollectionEquality().hash(fileBytes),
      fileExtension,
      studentNote,
      const DeepCollectionEquality().hash(_absencesIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JustifyAbsencesInfoImplCopyWith<_$JustifyAbsencesInfoImpl> get copyWith =>
      __$$JustifyAbsencesInfoImplCopyWithImpl<_$JustifyAbsencesInfoImpl>(
          this, _$identity);
}

abstract class _JustifyAbsencesInfo implements JustifyAbsencesInfo {
  const factory _JustifyAbsencesInfo(
      {required final String reason,
      required final Uint8List fileBytes,
      required final String fileExtension,
      required final String? studentNote,
      required final List<int> absencesIds}) = _$JustifyAbsencesInfoImpl;

  @override
  String get reason;
  @override
  Uint8List get fileBytes;
  @override
  String get fileExtension;
  @override
  String? get studentNote;
  @override
  List<int> get absencesIds;
  @override
  @JsonKey(ignore: true)
  _$$JustifyAbsencesInfoImplCopyWith<_$JustifyAbsencesInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
