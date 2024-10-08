import 'dart:convert';
import 'dart:io';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:pms_app/common/environment/environment.dart';
import 'package:pms_app/common/errors/session_expired_error.dart';
import 'package:pms_app/common/models/pagination.dart';
import 'package:pms_app/common/models/response_metadata.dart';
import 'package:pms_app/common/utils/query_params_builder.dart';
import 'package:pms_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:pms_app/features/student_features/student_schedule/data/abstract_repositories/time_slots_repository.dart';
import 'package:pms_app/features/student_features/student_schedule/domain/models/time_slot.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImplTimeSlotsRepository implements ITimeSlotsRepository {
  final ProviderRef ref;

  ImplTimeSlotsRepository({required this.ref});

  @override
  Future<Pagination<TimeSlot>> getPeriodTimeSlots(
    int periodId,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final queryParams = buildQueryParams({'page': '1', 'limit': '16'});

    final uri = Uri.parse(
        '${ENV.backendUrl}/periods/$periodId/time-slots/$queryParams');

    final response = await http.get(
      uri,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

    if (jsonResponse['message'] == 'Unauthorized') {
      await ref.read(authControllerProvider.notifier).logout();
      throw SessionExpiredError('Sesión expirada. Vuelva a Iniciar Sesión');
    }

    if (response.statusCode == 200) {
      final jsonItems = jsonResponse['items'] as List<dynamic>;
      final items = jsonItems.map((e) => TimeSlot.fromJson(e)).toList();
      final meta = ResponseMetadata.fromJson(jsonResponse['meta']);

      return Pagination(items: items, meta: meta);
    }

    throw Exception(jsonResponse['message']);
  }
}
