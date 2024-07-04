import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/components/buttons/primary_button.dart';
import 'package:pms_app/common/components/form_fields/text_form_field.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  bool obscuredPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Color.fromARGB(143, 0, 0, 0),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
          ),
          Container(
            constraints: const BoxConstraints(
              maxHeight: 600,
            ),
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            width: MediaQuery.of(context).size.width * .8,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Sistema Gestor de Permisos - PFC",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    "Inicio de Sesión",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Image.asset(
                    'assets/images/escudo_normal.png',
                    height: 200,
                  ),
                  OutlinedTextFormField(
                    label: "Correo institucional",
                    borderColor: Theme.of(context).colorScheme.primary,
                    prefixIcon: const Icon(
                      Icons.mail,
                      size: 25,
                    ),
                    autocorrect: true,
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 15),
                  OutlinedTextFormField(
                    label: "Contraseña",
                    obscureText: obscuredPassword,
                    maxLines: 1,
                    borderColor: Theme.of(context).colorScheme.primary,
                    prefixIcon: const Icon(
                      Icons.password,
                      size: 25,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscuredPassword = !obscuredPassword;
                        });
                      },
                      icon: obscuredPassword
                          ? const Icon(
                              Icons.remove_red_eye,
                              size: 25,
                            )
                          : const Icon(
                              Icons.visibility_off,
                              size: 25,
                            ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  PrimaryButton(
                    child: const Text(
                      "Ingresar",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {},
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
