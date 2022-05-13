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
                "Let's get started",
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.black,
                  fontSize: 27,
                ),
              ),
              Form(
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffF6F6F6),
                            hintText: "Name",
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
