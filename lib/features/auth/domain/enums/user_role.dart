enum UserRole {
  student,
  teacher,
  admin,
  secretary,
}

extension ToUserRole on String {
  UserRole toUserRole() {
    switch (this) {
      case 'STUDENT':
        return UserRole.student;
      case 'TEACHER':
        return UserRole.teacher;
      case 'SECRETARY':
        return UserRole.secretary;
      case 'ADMIN':
        return UserRole.admin;

      default:
        return UserRole.student;
    }
  }
}
