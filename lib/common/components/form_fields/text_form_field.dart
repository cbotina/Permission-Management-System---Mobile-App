import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OutlinedTextFormField extends StatelessWidget {
  final String? initialValue;
  final String label;
  final bool isNumberField;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int? maxLines;
  final bool isPassword;
  final double borderRadius;
  final String hint;

  const OutlinedTextFormField({
    super.key,
    this.initialValue,
    this.label = '',
    this.controller,
    this.isNumberField = false,
    this.validator,
    this.maxLines,
    this.isPassword = false,
    this.borderRadius = 7,
    this.hint = '',
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      initialValue: initialValue,
      style: Theme.of(context).textTheme.bodyMedium,
      obscureText: isPassword,
      enableSuggestions: false,
      autocorrect: false,
      autofillHints: hint.isNotEmpty ? [hint] : null,
      showCursor: true,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle:
            const TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
        isDense: true,
        label: label.isEmpty ? null : Text(label),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.surfaceTint,
            ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.surfaceTint,
            width: .8,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.surfaceTint,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.surfaceTint,
          ),
        ),
      ),
      inputFormatters: isNumberField
          ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))]
          : null,
      keyboardType: isNumberField ? TextInputType.number : TextInputType.text,
      onTapOutside: (e) {
        FocusScope.of(context).unfocus();
      },
      validator: validator,
    );
  }
}
