import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'Utils/Authentification_service.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "Email")),
            TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: "Email")),
            TextButton(
                onPressed: () {
                  context.read<AuthService>().signInEmailAndPassword(
                      email: emailController.text.trim(),
                      password: passwordController.text);
                },
                child: const Text("se connecter"))
          ],
        ),
      ),
    );
  }
}
