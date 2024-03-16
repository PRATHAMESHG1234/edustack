// ignore_for_file: use_build_context_synchronously

import 'package:edustack/config/active_screens.dart';
import 'package:edustack/config/constant.dart';
import 'package:edustack/config/databse.dart';
import 'package:edustack/config/model_classes.dart';
import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";

class Login extends StatefulWidget {
  final bool isSignup;
  final Function mainSetState;
  const Login({super.key, required this.isSignup, required this.mainSetState});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController? _nameController;
  TextEditingController? _emailController;
  TextEditingController? _passwordController;
  DataBaseManager? _dataBaseManager;
  bool _isObscure = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: "");
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _dataBaseManager = DataBaseManager();
  }

  void loginOrSignUpUser() async {
    bool authValidation = _formKey.currentState!.validate();
    bool retVal;
    print(authValidation);
    if (authValidation) {
      if (widget.isSignup) {
        print("hii i get call");
        UserModelClass newUser = UserModelClass(
            name: _nameController!.text.trim(),
            email: _emailController!.text.trim(),
            password: _passwordController!.text.trim(),
            isAdmin: 0);

        retVal = await _dataBaseManager!.insertUser(newUser);
        if (retVal) {
          widget.mainSetState(() {
            ActiveScreen.SIGNUPSCREEN = false;
            ActiveScreen.HOMESCREEN = true;
            ActiveScreen.COURSECONTENTSCREEN = false;
            ActiveScreen.LOGINSCREEN = false;
            ActiveScreen.COURSESCREEN = false;
          });
        }
      } else {
        retVal = await _dataBaseManager!.checkUser(
          email: _emailController!.text.trim(),
          password: _passwordController!.text.trim(),
        );
        if (retVal) {
          widget.mainSetState(() {
            ActiveScreen.SIGNUPSCREEN = false;
            ActiveScreen.HOMESCREEN = true;
            ActiveScreen.COURSECONTENTSCREEN = false;
            ActiveScreen.LOGINSCREEN = false;
            ActiveScreen.COURSESCREEN = false;
          });
        }
      }

      if (retVal) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text("${(widget.isSignup) ? "SignUp" : "Login"} Successful"),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("${(widget.isSignup) ? "SignUp" : "Login"} Failed"),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${(widget.isSignup) ? "SignUp" : "Login"} Failed"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                    widget.isSignup ? "Welcome!" : "Welcome back!",
                    style: GoogleFonts.jost(
                        fontWeight: FontWeight.w400,
                        fontSize: 48,
                        color: Colors.white),
                  ),
                  Text(
                    "Please ${widget.isSignup ? "sign up" : "log in"} to continue",
                    style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w400,
                        fontSize: 21,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: (widget.isSignup) ? 50 : 80,
                  left: 30,
                  right: 30,
                  bottom: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    (widget.isSignup) ? const Text("name") : const SizedBox(),
                    (widget.isSignup)
                        ? TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.clear_outlined),
                                onPressed: () => _nameController!.clear(),
                              ),
                              hintText: 'name',
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter name";
                              } else {
                                return null;
                              }
                            })
                        : const SizedBox(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Email"),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear_outlined),
                          onPressed: () => _nameController!.clear(),
                        ),
                        hintText: 'email',
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !value.contains(AppConstants.EMAILREGEX)) {
                          return "Please enter proper Email";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Password"),
                    TextFormField(
                      obscureText: _isObscure,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: _isObscure
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                        hintText: 'password',
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !value.contains(AppConstants.PASSWORDREGEX)) {
                          return "Please enter Password";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: (widget.isSignup) ? 0 : 10,
                    ),
                    (!widget.isSignup)
                        ? Text(
                            "forget password?",
                            style: GoogleFonts.anekTamil(
                              fontWeight: FontWeight.w400,
                              fontSize: 19,
                            ),
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 50,
                      width: 300,
                      padding: const EdgeInsets.only(left: 25),
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
                        onPressed: loginOrSignUpUser,
                        child: Text(
                          (widget.isSignup) ? "SignUp" : "Login",
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
                            "${(widget.isSignup) ? "Already" : "don`t"} have a account?",
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
                              (widget.isSignup) ? "Login" : "SignUp",
                              style: GoogleFonts.anekTamil(
                                fontWeight: FontWeight.w400,
                                fontSize: 19,
                                color: const Color.fromRGBO(202, 74, 74, 1),
                              ),
                            ),
                            onTap: () {
                              widget.mainSetState(() {
                                if (widget.isSignup) {
                                  ActiveScreen.SIGNUPSCREEN = false;
                                  ActiveScreen.LOGINSCREEN = true;
                                } else {
                                  ActiveScreen.LOGINSCREEN = false;
                                  ActiveScreen.SIGNUPSCREEN = true;
                                }
                              });
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
