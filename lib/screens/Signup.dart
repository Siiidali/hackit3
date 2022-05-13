import 'package:flutter/material.dart';
import 'package:hackit3/screens/SignIn.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Let's get \nstarted",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 38,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Veuillez insérer vos données",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 179, 179, 179),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        child: TextFormField(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xffF6F6F6),
                              hintText: "Name",
                              hintStyle: const TextStyle(
                                  color: Color(0xff908E8E),
                                  fontFamily: 'Inter'),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Color(0xff2CA58D).withOpacity(0.5)),
                                borderRadius: BorderRadius.circular(25),
                              )),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 50,
                        child: TextFormField(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffF6F6F6),
                              hintText: "Email",
                              hintStyle: const TextStyle(
                                  color: Color(0xff908E8E),
                                  fontFamily: 'Inter'),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Color(0xff2CA58D).withOpacity(0.5)),
                                borderRadius: BorderRadius.circular(25),
                              )),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 50,
                        child: TextFormField(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffF6F6F6),
                              hintText: "Date de naissance",
                              hintStyle: const TextStyle(
                                  color: Color(0xff908E8E),
                                  fontFamily: 'Inter'),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Color(0xff2CA58D).withOpacity(0.5)),
                                borderRadius: BorderRadius.circular(25),
                              )),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 50,
                        child: TextFormField(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffF6F6F6),
                              hintText: "Password",
                              hintStyle: const TextStyle(
                                  color: Color(0xff908E8E),
                                  fontFamily: 'Inter'),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Color(0xff2CA58D).withOpacity(0.5)),
                                borderRadius: BorderRadius.circular(25),
                              )),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 50,
                        child: TextFormField(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xffF6F6F6),
                              hintText: "Confirm password",
                              hintStyle: const TextStyle(
                                  color: Color(0xff908E8E),
                                  fontFamily: 'Inter'),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2,
                                    color: const Color(0xff2CA58D)
                                        .withOpacity(0.5)),
                                borderRadius: BorderRadius.circular(25),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    Center(
                        child: Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          )),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xff2CA58D)),
                        ),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              fontFamily: 'Lato',
                              color: Colors.white),
                        ),
                      ),
                    )),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignIn(),
                            ),
                          );
                        },
                        child: const Text(
                          "J'ai pas un compte",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
