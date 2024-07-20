import 'dart:developer';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/providers/repository_providers.dart';
import 'package:pms_app/features/student_features/student_unjustified_absences/data/abstract_repositories/unjustified_absences_repository.dart';
import 'package:pms_app/features/student_features/student_unjustified_absences/data/dto/justify_absences_info.dart';
import 'package:pms_app/features/student_features/student_unjustified_absences/data/dto/justify_absences_request_dto.dart';
import 'package:uuid/uuid.dart';

class JustifyAbsencesService {
  final IUnjustifiedAbsencesRepository _repository;

  JustifyAbsencesService({required IUnjustifiedAbsencesRepository repository})
      : _repository = repository;

  Future<bool> justifyAbsences(int studentId, JustifyAbsencesInfo info) async {
    try {
      var uuid = const Uuid();
      final fileName = '${uuid.v4()}.${info.fileExtension}';

      Reference fileRef =
          FirebaseStorage.instance.ref().child('evidences').child(fileName);

      UploadTask uploadTask = fileRef.putData(info.fileBytes);

      await uploadTask.whenComplete(() {
        log('exito');
      });

      final evidenceUrl = await fileRef.getDownloadURL();

      final dto = JustifyAbsencesRequestDto(
        reason: info.reason,
        evidenceUrl: evidenceUrl,
        studentNote: info.studentNote,
        unjustifiedAbsencesIds: info.absencesIds,
      );

      await _repository.justifyStudentAbsences(studentId, dto);

      return true;
    } catch (e) {
      return false;
    }
  }
}

final justifyAbsencesServiceProvider = Provider<JustifyAbsencesService>((ref) {
  return JustifyAbsencesService(
    repository: ref.watch(unjustifiedAbsencesRepositoryProvider),
  );
});
