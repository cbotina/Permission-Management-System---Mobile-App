import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/providers/repository_providers.dart';
import 'package:pms_app/features/student_features/student_enrollments/data/abstract_repositories/student_enrollments_repository.dart';
import 'package:pms_app/features/student_features/student_enrollments/data/providers/student_enrollments_provider.dart';
import 'package:pms_app/features/student_features/student_enrollments/data/repositories/mock_student_enrollments_repository.dart';
import 'package:pms_app/features/student_features/student_enrollments/domain/models/student_enrollment_view.dart';
import 'package:pms_app/features/session/data/providers/active_period_id_provider.dart';
import 'package:pms_app/features/session/data/providers/entity_id_provider.dart';
import 'package:pms_app/pages/student_pages/student_enrollments_page.dart';

void main() {
  group('StudentEnrollmentsPage', () {
    late MockStudentEnrollmentsRepository mockRepository;

    setUp(() {
      mockRepository = MockStudentEnrollmentsRepository();
    });

    Widget createTestWidget() {
      return ProviderScope(
        overrides: [
          studentEnrollmentsRepositoryProvider
              .overrideWithValue(mockRepository),
          activePeriodIdProvider.overrideWithValue(1),
          entityIdProvider.overrideWithValue(1),
        ],
        child: const MaterialApp(
          home: StudentEnrollmentsPage(),
        ),
      );
    }

    testWidgets('displays app bar with correct title',
        (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Mis Inscripciones'), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('displays loading indicator initially',
        (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());

      // Should show loading indicator while data is being fetched
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Cargando inscripciones...'), findsOneWidget);
    });

    testWidgets('displays enrollment tiles when data is loaded',
        (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Should display mock enrollment data
      expect(find.text('Matemáticas I'), findsOneWidget);
      expect(find.text('Prof. Ana García'), findsOneWidget);
      expect(find.text('Física II'), findsOneWidget);
      expect(find.text('Prof. Carlos Ruiz'), findsOneWidget);
      expect(find.text('Programación Avanzada'), findsOneWidget);
      expect(find.text('Prof. Laura Pérez'), findsOneWidget);
      expect(find.text('Historia del Arte'), findsOneWidget);
      expect(find.text('Prof. Miguel Hernández'), findsOneWidget);

      // Should display 4 enrollment tiles
      expect(find.byType(Card), findsNWidgets(4));
    });

    testWidgets('displays empty state when no enrollments',
        (WidgetTester tester) async {
      // Override with empty repository
      final emptyRepository = MockStudentEnrollmentsRepository();
      emptyRepository.mockData = [];

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            studentEnrollmentsRepositoryProvider
                .overrideWithValue(emptyRepository),
            activePeriodIdProvider.overrideWithValue(1),
            entityIdProvider.overrideWithValue(1),
          ],
          child: const MaterialApp(
            home: StudentEnrollmentsPage(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('No tienes inscripciones registradas'), findsOneWidget);
      expect(find.byIcon(Icons.school_outlined), findsOneWidget);
    });

    testWidgets('displays error state when API fails',
        (WidgetTester tester) async {
      // Override with error-throwing repository
      final errorRepository = MockStudentEnrollmentsRepository();
      errorRepository.shouldThrowError = true;

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            studentEnrollmentsRepositoryProvider
                .overrideWithValue(errorRepository),
            activePeriodIdProvider.overrideWithValue(1),
            entityIdProvider.overrideWithValue(1),
          ],
          child: const MaterialApp(
            home: StudentEnrollmentsPage(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Error al cargar las inscripciones'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text('Reintentar'), findsOneWidget);
    });
  });
}
