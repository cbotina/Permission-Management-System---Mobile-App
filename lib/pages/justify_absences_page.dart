import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/components/buttons/primary_button.dart';
import 'package:pms_app/common/components/buttons/secondary_button.dart';
import 'package:pms_app/common/components/form_fields/dropdown_button_form_field.dart';
import 'package:pms_app/common/components/form_fields/text_form_field.dart';
import 'package:pms_app/features/student_unjustified_absences/data/providers/justifiable_absences_provider.dart';
import 'package:pms_app/features/student_unjustified_absences/domain/models/unjustified_absence_details_view.dart';
import 'package:pms_app/features/student_unjustified_absences/presentation/widgets/components/justifiable_absence_check_box.dart';

class JustifyAbsencesPage extends ConsumerStatefulWidget {
  const JustifyAbsencesPage({super.key});

  @override
  ConsumerState<JustifyAbsencesPage> createState() =>
      _JustifyAbsencesPageState();
}

class _JustifyAbsencesPageState extends ConsumerState<JustifyAbsencesPage> {
  String? selectedReason;

  @override
  Widget build(BuildContext context) {
    final justifiableAbsences = ref.watch(justifiableAbsencesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Justificar Faltas"),
      ),
      body: justifiableAbsences.when(
        data: (data) {
          if (data.isEmpty) {
            return const Center(
              child: Text("No tienes faltas justificables..."),
            );
          }

          return ListView(
            padding: const EdgeInsets.all(15),
            children: [
              EnumDropdownButtonFormField(
                values: const ['Cita medica', 'Motivos familiares', 'Otro'],
                label: "Motivo",
                onSelected: (reason) {
                  setState(() {
                    selectedReason = reason;
                  });
                },
              ),
              const SizedBox(height: 10),
              Visibility(
                visible: selectedReason == 'Otro',
                child: const OutlinedTextFormField(
                  hint: "Especifique el motivo",
                ),
              ),
              const SizedBox(height: 15),
              JustifiableAbsencesWidget(data: data),
              const SizedBox(height: 30),
              const OutlinedTextFormField(
                label: "Nota de estudiante",
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  SecondaryButton(
                    child: Row(
                      children: [
                        Icon(
                          Icons.upload,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        Text(
                          "Subir evidencia",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(width: 15),
                  Text(
                    "file.jpg",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              PrimaryButton(
                minWidth: 150,
                minHeight: 30,
                child: const Text(
                  "Enviar Solicitud",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {},
              ),
            ],
          );
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}

class JustifiableAbsencesWidget extends StatelessWidget {
  final List<UnjustifiedAbsenceDetailsView> data;
  const JustifiableAbsencesWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "A continuación, marque las faltas que va a justificar. Recuerde que debe justificar sus faltas en un lapso no mayor a tres días hábiles.",
          style: TextStyle(
            fontWeight: FontWeight.normal,
            color: Color.fromARGB(255, 87, 87, 87),
          ),
        ),
        const SizedBox(height: 20),
        Column(
          children: data.map((e) {
            return JustifiableAbsencesCheckBox(absence: e);
          }).toList(),
        ),
      ],
    );
  }
}
