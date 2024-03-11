import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";

class SignUP extends StatefulWidget {
  const SignUP({super.key});

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 200, left: 40, bottom: 60),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(44, 55, 149, 0.57),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(157.5),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(),
                    Text(
                      "Welcome",
                      style: GoogleFonts.jost(
                          fontWeight: FontWeight.w400,
                          fontSize: 48,
                          color: Colors.white),
                    ),
                    Text(
                      "Please sign up to continue",
                      style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w400,
                          fontSize: 21,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 80, left: 30, right: 30, bottom: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Email"),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.5),
                              blurRadius: 10)
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                            fillColor: Colors.white,
                            hintText: 'Email',
                            border: InputBorder.none),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text("Password"),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.5),
                              blurRadius: 10)
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                            fillColor: Colors.white,
                            hintText: 'password',
                            border: InputBorder.none),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor:
                              const Color.fromRGBO(111, 81, 255, 1),
                        ),
                        onPressed: () {
                          // doedit ? submit(doedit, toDoModelObj) : submit(doedit);

                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Submit",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 40, left: 35),
                      child: Row(
                        children: [
                          Text(
                            "Already have a account?",
                            style: GoogleFonts.anekTamil(
                              fontWeight: FontWeight.w400,
                              fontSize: 19,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Login",
                            style: GoogleFonts.anekTamil(
                                fontWeight: FontWeight.w400,
                                fontSize: 19,
                                color: const Color.fromRGBO(202, 74, 74, 1)),
                          )
                        ],
                      ),
                    )
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
