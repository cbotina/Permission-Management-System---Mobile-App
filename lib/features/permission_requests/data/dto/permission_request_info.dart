import 'package:flutter/foundation.dart';
import 'package:pms_app/features/permission_requests/data/dto/permission_request_dto.dart';

@immutable
class PermissionRequestInfo {
  final String reason;
  final Uint8List fileBytes;
  final String fileExtension;
  final String? studentNote;

  final List<AbsenceTimeSlot> absenceTimeSlots;

  const PermissionRequestInfo({
    required this.reason,
    required this.fileExtension,
    required this.fileBytes,
    required this.studentNote,
    required this.absenceTimeSlots,
  });
}
