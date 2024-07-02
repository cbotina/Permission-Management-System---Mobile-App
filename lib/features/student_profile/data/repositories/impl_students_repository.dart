import 'dart:convert';

import 'package:pms_app/common/environment/environment.dart';
import 'package:pms_app/features/student_profile/data/abstract_repositories/students_repository.dart';
import 'package:pms_app/features/student_profile/domain/models/student.dart';
import 'package:http/http.dart' as http;

class ImplStudentsRepository implements IStudentsRepository {
  @override
  Future<Student> getStudent(int studentId) async {
    final uri = Uri.parse("${ENV.backendUrl}/students/$studentId");

    final response = await http.get(uri);

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

    return Student.fromJson(jsonResponse);
  }
}
