import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/providers/repository_providers.dart';
import 'package:pms_app/features/student_features/student_enrollments/data/abstract_repositories/student_enrollments_repository.dart';
import 'package:pms_app/features/student_features/student_enrollments/data/providers/student_enrollments_provider.dart';
import 'package:pms_app/features/student_features/student_enrollments/data/repositories/mock_student_enrollments_repository.dart';
import 'package:pms_app/features/student_features/student_enrollments/domain/models/student_enrollment_view.dart';
import 'package:pms_app/features/student_features/student_enrollments/presentation/widgets/components/student_enrollment_tile.dart';
import 'package:pms_app/features/student_features/student_enrollments/presentation/widgets/student_enrollments_widget.dart';
import 'package:pms_app/features/session/data/providers/active_period_id_provider.dart';
import 'package:pms_app/features/session/data/providers/entity_id_provider.dart';

void main() {
  group('StudentEnrollmentTile', () {
    testWidgets('displays enrollment information correctly',
        (WidgetTester tester) async {
      const enrollment = StudentEnrollmentView(
        enrollmentId: 1,
        subjectName: 'Matemáticas I',
        teacherName: 'Ana García',
        periodId: 1,
        studentId: 1,
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: StudentEnrollmentTile(enrollment: enrollment),
          ),
        ),
      );

      expect(find.text('Matemáticas I'), findsOneWidget);
      expect(find.text('Prof. Ana García'), findsOneWidget);
      expect(find.byType(Card), findsOneWidget);
      expect(find.byIcon(Icons.school), findsOneWidget);
    });

    testWidgets('calls onTap when tapped', (WidgetTester tester) async {
      bool onTapCalled = false;
      const enrollment = StudentEnrollmentView(
        enrollmentId: 1,
        subjectName: 'Matemáticas I',
        teacherName: 'Ana García',
        periodId: 1,
        studentId: 1,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StudentEnrollmentTile(
              enrollment: enrollment,
              onTap: () => onTapCalled = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(StudentEnrollmentTile));
      expect(onTapCalled, isTrue);
    });
  });

  group('StudentEnrollmentsWidget', () {
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
          home: Scaffold(
            body: StudentEnrollmentsWidget(),
          ),
        ),
      );
    }

    testWidgets('displays loading state initially',
        (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Cargando inscripciones...'), findsOneWidget);
    });

    testWidgets('displays enrollment tiles when data loads',
        (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Matemáticas I'), findsOneWidget);
      expect(find.text('Prof. Ana García'), findsOneWidget);
      expect(find.byType(StudentEnrollmentTile), findsNWidgets(4));
    });

    testWidgets('displays empty state when no enrollments',
        (WidgetTester tester) async {
      mockRepository.mockData = [];

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('No tienes inscripciones registradas'), findsOneWidget);
      expect(find.byIcon(Icons.school_outlined), findsOneWidget);
    });

    testWidgets('displays error state when API fails',
        (WidgetTester tester) async {
      mockRepository.shouldThrowError = true;

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Error al cargar las inscripciones'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text('Reintentar'), findsOneWidget);
    });

    testWidgets('displays correct number of enrollment tiles',
        (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Should display 4 enrollment tiles
      expect(find.byType(StudentEnrollmentTile), findsNWidgets(4));
      expect(find.byType(Card), findsNWidgets(4));
    });

    testWidgets('enrollment tiles have correct content',
        (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Check all expected content is present
      expect(find.text('Matemáticas I'), findsOneWidget);
      expect(find.text('Prof. Ana García'), findsOneWidget);
      expect(find.text('Física II'), findsOneWidget);
      expect(find.text('Prof. Carlos Ruiz'), findsOneWidget);
      expect(find.text('Programación Avanzada'), findsOneWidget);
      expect(find.text('Prof. Laura Pérez'), findsOneWidget);
      expect(find.text('Historia del Arte'), findsOneWidget);
      expect(find.text('Prof. Miguel Hernández'), findsOneWidget);
    });
  });
}
