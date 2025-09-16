import 'dart:convert';
import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/environment/environment.dart';
import 'package:pms_app/common/errors/session_expired_error.dart';
import 'package:pms_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:pms_app/features/student_features/student_enrollments/data/abstract_repositories/student_enrollments_repository.dart';
import 'package:pms_app/features/student_features/student_enrollments/domain/models/student_enrollment_view.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ImplStudentEnrollmentsRepository
    implements IStudentEnrollmentsRepository {
  final ProviderRef ref;

  ImplStudentEnrollmentsRepository({required this.ref});

  @override
  Future<List<StudentEnrollmentView>> getStudentEnrollments(
      int periodId, int studentId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final uri = Uri.parse(
        "${ENV.backendUrl}/periods/$periodId/students/$studentId/enrollments");

    final response = await http.get(
      uri,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );

    final decodedResponse = jsonDecode(response.body);

    // Handle different response structures
    List<dynamic> enrollmentsJson;

    if (decodedResponse is List) {
      // API returns a list directly
      enrollmentsJson = decodedResponse;
    } else if (decodedResponse is Map<String, dynamic>) {
      final jsonResponse = decodedResponse;

      if (jsonResponse['message'] == 'Unauthorized') {
        await ref.read(authControllerProvider.notifier).logout();
        throw SessionExpiredError('Sesión expirada. Vuelva a Iniciar Sesión');
      }

      if (response.statusCode != 200) {
        throw Exception(
            jsonResponse['message'] ?? 'Error al obtener las inscripciones');
      }

      if (jsonResponse.containsKey('data')) {
        enrollmentsJson = jsonResponse['data'] as List<dynamic>;
      } else if (jsonResponse.containsKey('enrollments')) {
        enrollmentsJson = jsonResponse['enrollments'] as List<dynamic>;
      } else {
        // If it's a single object, wrap it in a list
        enrollmentsJson = [jsonResponse];
      }
    } else {
      throw Exception('Formato de respuesta inesperado');
    }

    return enrollmentsJson
        .map((json) =>
            StudentEnrollmentView.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
