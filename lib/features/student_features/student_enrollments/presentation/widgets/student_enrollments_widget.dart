import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/features/student_features/student_enrollments/data/providers/student_enrollments_provider.dart';
import 'package:pms_app/features/student_features/student_enrollments/presentation/widgets/components/student_enrollment_tile.dart';

class StudentEnrollmentsWidget extends ConsumerWidget {
  const StudentEnrollmentsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enrollments = ref.watch(studentEnrollmentsProvider);

    return enrollments.when(
      data: (enrollments) {
        if (enrollments.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.school_outlined,
                  size: 64,
                  color: Color.fromARGB(255, 37, 8, 8),
                ),
                SizedBox(height: 16),
                Text(
                  'No tienes inscripciones registradas',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Contacta a tu coordinador académico para más información',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(studentEnrollmentsProvider);
          },
          child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: enrollments.length,
            itemBuilder: (context, index) {
              return StudentEnrollmentTile(
                enrollment: enrollments[index],
              );
            },
          ),
        );
      },
      loading: () => const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Cargando inscripciones...'),
          ],
        ),
      ),
      error: (error, stackTrace) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              'Error al cargar las inscripciones',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              error.toString(),
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ref.invalidate(studentEnrollmentsProvider);
              },
              child: const Text('Reintentar'),
            ),
          ],
        ),
      ),
    );
  }
}
