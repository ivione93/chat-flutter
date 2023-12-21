import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chat/services/socket_service.dart';
import 'package:chat/services/auth_service.dart';
import 'package:chat/widgets/blue_button.dart';
import 'package:chat/widgets/custom_input.dart';
import 'package:chat/widgets/logo.dart';
import 'package:chat/widgets/labels.dart';
import 'package:chat/helpers/mostrar_alerta.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.95,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Logo(title: 'Messenger'),
                _Form(),
                Labels(ruta: 'register', textInfo: '¿No tienes cuenta?', textLink: '¡Crear cuenta!',),
                Text('Términos y condiciones de uso', style: TextStyle(fontWeight: FontWeight.w200)),
                SizedBox(height: 5)
              ],),
          ),
        ),
      )
    );
  }
}

class _Form extends StatefulWidget {
  const _Form({super.key});

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context);
    final socketService = Provider.of<SocketService>(context);

    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Email',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Constraseña',
            keyboardType: TextInputType.emailAddress,
            textController: passCtrl,
            isPassword: true,
          ),
          BlueButton(
            text: 'Entrar',
            onPressed: authService.autenticando ? null : () async {
              FocusScope.of(context).unfocus();
              final login = await authService.login(emailCtrl.text.trim(), passCtrl.text.trim());

              if (login) {
                // Navegar a otra pantalla
                socketService.connect();
                Navigator.pushReplacementNamed(context, 'usuarios');
              } else {
                // Alerta
                mostrarAlerta(context, 'Login incorrecto', 'Credenciales incorrectas');
              }
            },
          )
        ],
      ),
    );
  }
}