import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/components/tile.dart';
import 'package:pms_app/features/session/data/providers/entity_id_provider.dart';
import 'package:pms_app/features/student_features/student_profile/presentation/widgets/icon_buttons.dart';
import 'package:pms_app/features/teacher_features/teacher_profile/data/providers/teacher_info_repository.dart';

class TeacherProfilePage extends ConsumerWidget {
  const TeacherProfilePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final entityId = ref.watch(entityIdProvider);
    print(entityId);
    final teacher = ref.watch(teacherInfoProvider(entityId));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mi Perfil"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          return ref.invalidate(teacherInfoProvider);
        },
        child: teacher.when(
          data: (data) {
            return ListView(
              children: [
                Tile(
                  iconData: Icons.person_outline_rounded,
                  title: '${data.firstName} ${data.lastName}',
                  subtitle: 'Nombre',
                  reversed: true,
                  trailingIcon: const SizedBox(),
                ),
                Tile(
                  iconData: Icons.numbers,
                  title: data.cc,
                  subtitle: 'Identificación',
                  reversed: true,
                  trailingIcon: const SizedBox(),
                ),
                Tile(
                  iconData: Icons.mail_outline_rounded,
                  title: data.email ?? "",
                  subtitle: 'Correo institucional',
                  reversed: true,
                  trailingIcon: const SizedBox(),
                ),
                const Tile(
                  iconData: Icons.password_rounded,
                  title: '********',
                  subtitle: 'Cambiar contraseña',
                  reversed: true,
                  trailingIcon: ChangePasswordIconButton(),
                ),
              ],
            );
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const Center(child: CircularProgressIndicator()),
          skipLoadingOnRefresh: false,
        ),
      ),
    );
  }
}
