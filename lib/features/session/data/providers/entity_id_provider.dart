import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/features/auth/presentation/controllers/auth_controller.dart';

final entityIdProvider = Provider<int>((ref) {
  return 8;
  // return ref.watch(authControllerProvider).when(
  //       data: (data) => data.entityId ?? 0,
  //       error: (error, stackTrace) => 0,
  //       loading: () => 0,
  //     );
});
