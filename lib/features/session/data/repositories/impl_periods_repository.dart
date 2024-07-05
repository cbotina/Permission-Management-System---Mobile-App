import 'dart:convert';

import 'package:pms_app/common/environment/environment.dart';
import 'package:pms_app/features/session/data/abstract_repositories/periods_repository.dart';
import 'package:pms_app/features/session/domain/models/period.dart';
import 'package:http/http.dart' as http;

class ImplPeriodsRepository implements IPeriodsRepository {
  @override
  Future<Period?> getActivePeriod() async {
    final uri = Uri.parse("${ENV.backendUrl}/periods/active");

    final response = await http.get(uri);
    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

    return Period.fromJson(jsonResponse);
  }
}
