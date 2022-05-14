import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../Utils/Authentification_service.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late ConnectivityResult _connectivityResult = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _streamSubscription;

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectivityResult = result;
    });
  }

  bool loading = false;

  bool validEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  bool validPassword(String password) {
    return password.length >= 6 ? true : false;
  }

  void _showDialog(BuildContext context, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text("Oups !"),
          content: Text(msg),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

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
                  String email = emailController.text.trim();
                  String password = passwordController.text;

                  if (_connectivityResult.toString() ==
                      "ConnectivityResult.none") {
                    // No internet
                    _showDialog(context, "Pas de connexion internet");
                  } else {
                    if (email.isNotEmpty && password.isNotEmpty) {
                      if (validEmail(email)) {
                        debugPrint("Valid email");
                        if (validPassword(password)) {
                          // Everything clear
                          setState(() {
                            loading = true;
                          });

                          // Firebase sign in with email and password
                          context
                              .read<AuthService>()
                              .signInEmailAndPassword(
                                email: email,
                                password: password,
                              )
                              .then((value) {
                            String msg = value.toString();

                            switch (msg) {
                              case "null":
                                debugPrint("ERROR BSAH J SS PAS WSHNO");
                                _showDialog(
                                    context, "Un erreur est intervenue.");
                                break;

                              case "1":
                                debugPrint(
                                    "ERROR No user found for that email.");
                                _showDialog(context, "Compte inexistant");
                                setState(() {
                                  loading = false;
                                  emailController.text = "";
                                  passwordController.text = "";
                                });
                                break;

                              case "2":
                                debugPrint(
                                    "ERROR Wrong password provided for that user.");
                                _showDialog(context, "Mot de passe incorrect");
                                setState(() {
                                  loading = false;
                                  passwordController.text = "";
                                });
                                break;

                              default:
                                Future.delayed(
                                        const Duration(milliseconds: 2500))
                                    .then((onValue) {
                                  setState(() {
                                    loading = false;
                                  });
                                  Navigator.pop(context);
                                });
                            }
                          });
                        } else {
                          // password invalid
                          debugPrint("Mot de passe trop petit");
                          _showDialog(context, "Mot de passe trop petit");
                        }
                      } else {
                        // do smth email invlid
                        debugPrint("Email invalide");
                        _showDialog(context, "Email invalide");
                      }
                    } else {
                      // Empty field
                      _showDialog(context, "Veuillez remplir tout les champs");
                    }
                  }
                },
                child: const Text("se connecter"))
          ],
        ),
      ),
    );
  }
}
