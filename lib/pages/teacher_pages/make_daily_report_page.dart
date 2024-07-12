import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/components/buttons/primary_button.dart';
import 'package:pms_app/common/extensions/capitalize.dart';
import 'package:pms_app/features/student_features/student_permissions/domain/models/permission.dart';
import 'package:pms_app/features/student_features/student_permissions/presentation/widgets/components/permission_status.dart';
import 'package:pms_app/features/student_features/student_profile/domain/models/student.dart';
import 'package:pms_app/features/teacher_features/daily_reports/data/providers/memory_daily_report_data.dart';
import 'package:pms_app/features/teacher_features/daily_reports/data/providers/subject_group_students_with_permissions_provider.dart';
import 'package:pms_app/features/teacher_features/daily_reports/domain/models/student_with_permission.dart';
import 'package:pms_app/features/teacher_features/daily_reports/presentation/widgets/components/add_comment_to_absence_form.dart';
import 'package:pms_app/features/teacher_features/teacher_schedule/domain/models/schedule_with_daily_report.dart';

class MakeDailyReportPage extends ConsumerWidget {
  final ScheduleWithDailyReport data;
  const MakeDailyReportPage({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context, ref) {
    final students = ref.watch(
      subjectGroupStudentsWithPermissionsProvider(data),
    );

    students.when(
      data: (studentsWithPermission) {
        Future(() {
          ref.read(memoryDailyReportDataProvider.notifier).clearData();

          ref
              .read(memoryDailyReportDataProvider.notifier)
              .setData(studentsWithPermission);
        });
      },
      error: (error, stackTrace) {},
      loading: () {},
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Llamado de Lista"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          const Text("Lista de Estudiantes"),
          Column(children: [
            Consumer(
              builder: (context, ref, child) {
                final memoryData =
                    ref.watch(memoryDailyReportDataProvider).data;

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    for (int i = 0; i < memoryData.length; i++)
                      StudentWidget(
                        index: i,
                      ),
                  ]),
                );
              },
            ),
          ]),
        ],
      ),
    );
  }
}

class StudentWidget extends ConsumerStatefulWidget {
  final int index;

  const StudentWidget({
    super.key,
    required this.index,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StudentWidgetState();
}

class _StudentWidgetState extends ConsumerState<StudentWidget> {
  bool? absent;

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(memoryDailyReportDataProvider).data[widget.index];

    Color getBackgroundColor(bool? absent) {
      if (absent == null) return Colors.white;
      if (absent == true) return const Color.fromARGB(255, 255, 148, 184);
      if (absent == false) return const Color.fromARGB(255, 167, 255, 234);
      return Colors.white;
    }

    return Material(
      type: MaterialType.transparency,
      child: Container(
        width: 250,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: getBackgroundColor(data.absent),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(14, 0, 0, 0),
              offset: Offset(1, 1),
              blurRadius: 4,
              spreadRadius: 2,
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              data.data.student.studentGender == Gender.male
                  ? 'images/man.png'
                  : 'images/woman.png',
              width: 170,
            ),
            Text(
              data.data.student.studentLastName.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              data.data.student.studentFirstName.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Visibility(
              visible: data.data.permission != null,
              child: PermissionStatusWidget(
                status: data.data.permission?.permissionStatus ??
                    PermissionStatus.pending,
                verbose: true,
              ),
            ),
            Visibility(
              visible: data.data.permission == null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SetAbsentButton(
                    onTap: () {
                      setState(() {
                        ref
                            .read(memoryDailyReportDataProvider.notifier)
                            .setAbsent(true, widget.index);

                        absent = data.absent;
                      });
                    },
                  ),
                  Visibility(
                    visible: data.absent == true,
                    child: SetCommentButton(
                      hasComment: data.comment != null && data.comment != '',
                      onTap: () async {
                        final comment = await showDialog<String>(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                title: const Text("Agregar comentario"),
                                content: AddCommentToAbsenceForm(
                                  existingComment: data.comment,
                                ));
                          },
                        );

                        ref
                            .read(memoryDailyReportDataProvider.notifier)
                            .addComment(comment ?? "", widget.index);
                      },
                    ),
                  ),
                  SetPresentButton(
                    onTap: () {
                      setState(() {
                        ref
                            .read(memoryDailyReportDataProvider.notifier)
                            .setAbsent(false, widget.index);

                        absent = data.absent;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SetCommentButton extends StatelessWidget {
  final VoidCallback? onTap;
  final bool hasComment;
  const SetCommentButton({
    super.key,
    this.onTap,
    required this.hasComment,
  });

  Color getBackgroundColor(bool hasComment) {
    if (hasComment) return Colors.blue;
    return Colors.white;
  }

  Color getForegroundColor(bool hasComment) {
    if (hasComment) return Colors.white;
    return Colors.blue;
  }

  Color getBorderColor(bool hasComment) {
    if (hasComment) return Colors.transparent;
    return Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Ink(
        width: 50,
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: getBackgroundColor(hasComment),
            border: Border.all(color: getBorderColor(hasComment))),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onTap,
          child: Icon(
            Icons.comment,
            color: getForegroundColor(hasComment),
          ),
        ),
      ),
    );
  }
}

class SetAbsentButton extends StatelessWidget {
  final VoidCallback? onTap;
  const SetAbsentButton({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Ink(
        width: 50,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.pink,
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: const Icon(
            Icons.close_outlined,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class SetPresentButton extends StatelessWidget {
  final VoidCallback? onTap;
  const SetPresentButton({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Ink(
        width: 50,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.tealAccent,
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: const Icon(
            Icons.check,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
