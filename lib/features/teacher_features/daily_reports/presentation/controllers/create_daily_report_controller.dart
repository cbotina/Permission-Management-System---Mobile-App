import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/providers/repository_providers.dart';
import 'package:pms_app/features/teacher_features/daily_reports/data/abstract_repositories/daily_reports_repository.dart';
import 'package:pms_app/features/teacher_features/daily_reports/data/dto/create_daily_report_dto.dart';
import 'package:pms_app/features/teacher_features/teacher_schedule/data/providers/schedule_with_daily_reports_provider.dart';

class CreateDailyReportController extends AsyncNotifier<void> {
  late final IDailyReportsRepository _repository =
      ref.watch(dailyReportsRepositoryProvider);
  @override
  FutureOr<void> build() {}

  Future<void> createDailyReport(CreateDailyReportDto dto) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _repository.createDailyReport(dto));
    ref.invalidate(scheduleWithDailyReportsProvider);
  }
}

final createDailyReportControllerProvider =
    AsyncNotifierProvider<CreateDailyReportController, void>(
  () => CreateDailyReportController(),
);
