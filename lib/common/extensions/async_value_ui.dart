import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/components/buttons/primary_button.dart';

extension AsyncValueUI on AsyncValue {
  void dialogOnError(BuildContext context) {
    if (!isLoading && hasError) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              "Ha ocurrido un error",
              textAlign: TextAlign.center,
            ),
            content: Text(error.toString().substring(10)),
            actions: [
              PrimaryButton(
                onTap: Navigator.of(context).pop,
                child: const Text(
                  "Entendido",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          );
        },
      );
    }
  }

  void popOnSuccess(AsyncValue? prev, BuildContext context) {
    if (!isLoading && !hasError && prev != null) {
      Navigator.of(context).pop();
    }
  }

  void dialogOnSuccess(AsyncValue? prev, String message, BuildContext context) {
    if (!isLoading && !hasError && prev != null) {
      Navigator.of(context).pop();
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(message),
            actions: [
              PrimaryButton(
                onTap: Navigator.of(context).pop,
                child: const Text(
                  "Entendido",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          );
        },
      );

      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text(
      //       message,
      //       style: const TextStyle(color: Colors.white),
      //     ),
      //     duration: const Duration(seconds: 2),
      //   ),
      // );
    }
  }
}
