import 'package:flutter/material.dart';
import 'package:hackit3/screens/Children.dart';
import 'package:hackit3/screens/SignIn.dart';

import 'HomePage.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          backgroundColor: const Color(0xFFFAFCFB),
          elevation: 0,
        ),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Let's get \nstarted",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    color: Color(0xff0A2342),
                    fontSize: 34,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 15),
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
                                    color: Color(0xff8ABFCBD).withOpacity(0.5)),
                                borderRadius: BorderRadius.circular(25),
                              )),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 15),
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
                        height: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 15),
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
                        height: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 15),
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
                        height: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 15),
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
                  height: MediaQuery.of(context).size.height * 0.11,
                ),
                Column(
                  children: [
                    Center(
                        child: Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => HomePage())));
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          )),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xff8ABFCB)),
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
                                  builder: ((context) => Children())));
                        },
                        child: Text(
                          "Already have an account?",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Color(0xffEFAF33).withOpacity(0.6)),
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
