// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace


import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const Text(
                "Welcome \nBack!",
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.black,
                  fontSize: 27,
                ),
              ),
              Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffF6F6F6),
                            hintText: "Email",
                            hintStyle: const TextStyle(
                                color: Color(0xff908E8E), fontFamily: 'Inter'),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Color(0xff2CA58D).withOpacity(0.5)),
                              borderRadius: BorderRadius.circular(15),
                            )),
                      ),
                    ),
                    Container(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffF6F6F6),
                            hintText: "Password",
                            hintStyle: const TextStyle(
                                color: Color(0xff908E8E), fontFamily: 'Inter'),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Color(0xff2CA58D).withOpacity(0.5)),
                              borderRadius: BorderRadius.circular(15),
                            )),
                      ),
                    ),
                    Expanded(child: SizedBox(),),
                    GestureDetector(
                      child: Container(
                        height: 48,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Color(0xff2CA58D),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
