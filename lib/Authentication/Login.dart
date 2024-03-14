import 'package:edustack/Authentication/SignUp.dart';
import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 170, left: 40, bottom: 60),
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
                      "Please sign in to continue",
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
                      padding: EdgeInsets.symmetric(horizontal: 20),
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
                            suffixIcon: Icon(Icons.clear_outlined),
                            // contentPadding: EdgeInsets.only(left: 20),
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
                      padding: EdgeInsets.symmetric(horizontal: 20),
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
                            suffixIcon: Icon(Icons.remove_red_eye_outlined),
                            fillColor: Colors.white,
                            hintText: 'password',
                            border: InputBorder.none),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "forget password?",
                      style: GoogleFonts.anekTamil(
                        fontWeight: FontWeight.w400,
                        fontSize: 19,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50,
                      width: 300,
                      padding: EdgeInsets.only(left: 25),
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
                          "Login",
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
                            "Dont have a account?",
                            style: GoogleFonts.anekTamil(
                              fontWeight: FontWeight.w400,
                              fontSize: 19,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            child: Text(
                              "SignUp",
                              style: GoogleFonts.anekTamil(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 19,
                                  color: const Color.fromRGBO(202, 74, 74, 1)),
                            ),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const SignUP();
                              }));
                            },
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
