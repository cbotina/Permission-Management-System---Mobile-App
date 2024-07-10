import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'justify_absences_info.freezed.dart';

@freezed
class JustifyAbsencesInfo with _$JustifyAbsencesInfo {
  const factory JustifyAbsencesInfo({
    required String reason,
    required Uint8List fileBytes,
    required String fileExtension,
    required String? studentNote,
    required List<int> absencesIds,
  }) = _JustifyAbsencesInfo;
}
