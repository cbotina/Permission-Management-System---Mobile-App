import 'dart:developer';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/providers/repository_providers.dart';
import 'package:pms_app/features/session/data/providers/active_period_provider.dart';
import 'package:pms_app/features/session/domain/models/period.dart';
import 'package:pms_app/features/student_features/permission_requests/data/abstract_repositories/permission_request_repository.dart';
import 'package:pms_app/features/student_features/permission_requests/data/dto/justify_leaving_permission_dto.dart';
import 'package:pms_app/features/student_features/permission_requests/data/dto/justify_leaving_permission_info.dart';
import 'package:pms_app/features/student_features/permission_requests/data/dto/permission_request_dto.dart';
import 'package:pms_app/features/student_features/permission_requests/data/dto/permission_request_info.dart';
import 'package:uuid/uuid.dart';

class PermissionRequestsService {
  final IPermissionRequestRepository _repository;
  final Period? _activePeriod;

  PermissionRequestsService({
    required IPermissionRequestRepository repository,
    required Period? activePeriod,
  })  : _repository = repository,
        _activePeriod = activePeriod;

// access studentId from here
  Future<bool> createPermissionRequest(
      int studentId, PermissionRequestInfo info) async {
    try {
      var uuid = const Uuid();
      final fileName =
          '${_activePeriod?.name ?? ""}/${uuid.v4()}.${info.fileExtension}';

      Reference fileRef =
          FirebaseStorage.instance.ref().child('evidences').child(fileName);

      UploadTask uploadTask = fileRef.putData(info.fileBytes);

      await uploadTask.whenComplete(() {
        log('exito');
      });

      final evidenceUrl = await fileRef.getDownloadURL();

      final dto = PermissionRequestDto(
        reason: info.reason,
        evidenceUrl: evidenceUrl,
        absenceTimeSlots: info.absenceTimeSlots,
        studentNote: info.studentNote,
      );

      await _repository.createPermissionRequest(studentId, dto);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> justifyLeavingPermission(
      int permissionId, JustifyLeavingPermissionInfo info) async {
    try {
      var uuid = const Uuid();
      final fileName =
          '${_activePeriod?.name ?? ""}/${uuid.v4()}.${info.fileExtension}';

      Reference fileRef =
          FirebaseStorage.instance.ref().child('evidences').child(fileName);

      UploadTask uploadTask = fileRef.putData(info.fileBytes);

      await uploadTask.whenComplete(() {
        log('exito');
      });

      final evidenceUrl = await fileRef.getDownloadURL();

      final dto = JustifyLeavingPermissionDto(evidenceUrl: evidenceUrl);

      await _repository.justifyLeavingPermission(permissionId, dto);
      return true;
    } catch (e) {
      return false;
    }
  }
}

final permissionRequestServiceProvider =
    Provider<PermissionRequestsService>((ref) {
  return PermissionRequestsService(
    repository: ref.watch(permissionRequestRepositoryProvider),
    activePeriod: ref.watch(activePeriodProvider),
  );
});
