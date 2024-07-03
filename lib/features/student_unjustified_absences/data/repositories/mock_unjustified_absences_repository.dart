import 'package:flutter/material.dart';
import 'package:pms_app/common/models/pagination.dart';
import 'package:pms_app/common/models/response_metadata.dart';
import 'package:pms_app/features/student_permissions/domain/models/permission.dart';
import 'package:pms_app/features/student_unjustified_absences/data/abstract_repositories/unjustified_absences_repository.dart';
import 'package:pms_app/features/student_unjustified_absences/data/dto/justify_absences_request_dto.dart';
import 'package:pms_app/features/student_unjustified_absences/domain/models/unjustified_absence_details_view.dart';

class MockUnjustifiedAbsencesRepository
    implements IUnjustifiedAbsencesRepository {
  @override
  Future<Pagination<UnjustifiedAbsenceDetailsView>>
      getStudentUnjustifiedAbsences(int periodId, int studentId, int page) {
    return Future.value(mockUnjustifiedAbsences);
  }

  @override
  Future<void> justifyStudentAbsences(
      int studentId, JustifyAbsencesRequestDto dto) {
    return Future.value(null);
  }
}

Pagination<UnjustifiedAbsenceDetailsView> mockUnjustifiedAbsences = Pagination(
  items: [
    UnjustifiedAbsenceDetailsView(
      absenceId: 4,
      absenceDate: DateTime(2024, 1, 1),
      startTime: const TimeOfDay(hour: 7, minute: 0),
      endTime: const TimeOfDay(hour: 7, minute: 0),
      teacherNote: 'Hola',
      subjectName: "Matematicas",
      permissionStatus: PermissionStatus.approved,
    ),
    UnjustifiedAbsenceDetailsView(
      absenceId: 4,
      absenceDate: DateTime(2024, 1, 1),
      startTime: const TimeOfDay(hour: 7, minute: 0),
      endTime: const TimeOfDay(hour: 7, minute: 0),
      teacherNote: 'Hola',
      subjectName: "Matematicas",
      permissionStatus: PermissionStatus.approved,
    ),
    UnjustifiedAbsenceDetailsView(
      absenceId: 4,
      absenceDate: DateTime(2024, 1, 1),
      startTime: const TimeOfDay(hour: 7, minute: 0),
      endTime: const TimeOfDay(hour: 7, minute: 0),
      teacherNote: 'Hola',
      subjectName: "Matematicas",
      permissionStatus: PermissionStatus.leavePermission,
    ),
    UnjustifiedAbsenceDetailsView(
      absenceId: 4,
      absenceDate: DateTime(2024, 1, 1),
      startTime: const TimeOfDay(hour: 7, minute: 0),
      endTime: const TimeOfDay(hour: 7, minute: 0),
      teacherNote: 'Hola',
      subjectName: "Matematicas",
      permissionStatus: PermissionStatus.rejected,
    ),
    UnjustifiedAbsenceDetailsView(
      absenceId: 4,
      absenceDate: DateTime(2024, 1, 1),
      startTime: const TimeOfDay(hour: 7, minute: 0),
      endTime: const TimeOfDay(hour: 7, minute: 0),
      teacherNote: 'Hola',
      subjectName: "Matematicas",
      permissionStatus: PermissionStatus.pending,
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
