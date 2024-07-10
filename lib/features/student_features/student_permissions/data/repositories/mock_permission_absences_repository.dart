import 'package:flutter/material.dart';
import 'package:pms_app/common/models/pagination.dart';
import 'package:pms_app/common/models/response_metadata.dart';
import 'package:pms_app/features/student_features/student_permissions/data/abstract_repositories/permission_absences_repository.dart';
import 'package:pms_app/features/student_features/student_permissions/domain/models/permission_absence_view.dart';

class MockPermissionAbsencesRepository
    implements IPermissionAbsencesRepository {
  @override
  Future<Pagination<PermissionAbsenceView>> getStudentPermissionAbsences(
      int studentId, int permissionId, int page) {
    return Future.value(mockPermissionAbsences);
  }
}

final Pagination<PermissionAbsenceView> mockPermissionAbsences = Pagination(
  items: [
    PermissionAbsenceView(
      absenceDate: DateTime.now(),
      startTime: const TimeOfDay(hour: 7, minute: 55),
      endtime: const TimeOfDay(hour: 7, minute: 55),
      teacherNote: 'Se evadio',
      subjectName: 'Comunicacion y Lenguaje I',
    ),
    PermissionAbsenceView(
      absenceDate: DateTime.now(),
      startTime: const TimeOfDay(hour: 7, minute: 55),
      endtime: const TimeOfDay(hour: 7, minute: 55),
      teacherNote: null,
      subjectName: 'Comunicacion y Lenguaje I',
    ),
    PermissionAbsenceView(
      absenceDate: DateTime.now(),
      startTime: const TimeOfDay(hour: 7, minute: 55),
      endtime: const TimeOfDay(hour: 7, minute: 55),
      teacherNote: 'Nunca llego a clase',
      subjectName: 'Didactica General',
    ),
  ],
  meta: const ResponseMetadata(
    totalItems: 3,
    itemCount: 3,
    itemsPerPage: 3,
    totalPages: 1,
    currentPage: 1,
  ),
);
