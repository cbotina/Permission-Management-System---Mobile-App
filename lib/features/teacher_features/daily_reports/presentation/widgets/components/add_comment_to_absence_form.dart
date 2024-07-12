import 'package:flutter/material.dart';
import 'package:pms_app/common/components/buttons/primary_button.dart';
import 'package:pms_app/common/components/form_fields/text_form_field.dart';

class AddCommentToAbsenceForm extends StatefulWidget {
  final String? existingComment;
  const AddCommentToAbsenceForm({super.key, this.existingComment});

  @override
  State<AddCommentToAbsenceForm> createState() =>
      _AddCommentToAbsenceFormState();
}

class _AddCommentToAbsenceFormState extends State<AddCommentToAbsenceForm> {
  late TextEditingController _commentController;

  @override
  void initState() {
    _commentController = TextEditingController(text: widget.existingComment);
    super.initState();
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        OutlinedTextFormField(
          label: 'Comentario docente',
          controller: _commentController,
        ),
        const SizedBox(height: 10),
        PrimaryButton(
            onTap: () => Navigator.of(context).pop(_commentController.text),
            child: const Text(
              "Aceptar",
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}
