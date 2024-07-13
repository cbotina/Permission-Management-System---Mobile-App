import 'package:pms_app/features/student_features/student_profile/domain/models/student.dart';

extension ToGender on String {
  Gender toGender() {
    switch (this) {
      case 'M':
        return Gender.male;
      default:
        return Gender.female;
    }
  }
}
