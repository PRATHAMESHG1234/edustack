// ignore_for_file: use_build_context_synchronously

import 'package:edustack/config/active_screens.dart';
import 'package:edustack/config/databse.dart';
import 'package:edustack/config/model_classes.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class AddCourse extends StatefulWidget {
  final Function mainSetState;
  const AddCourse({super.key, required this.mainSetState});

  @override
  State<AddCourse> createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  TextEditingController? _courseNameController;
  TextEditingController? _startDateController;
  TextEditingController? _endDateController;
  TextEditingController? _imagePathController;
  DataBaseManager? _dataBaseManager;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _courseNameController = TextEditingController(text: "");
    _startDateController = TextEditingController();
    _endDateController = TextEditingController();
    _imagePathController = TextEditingController();
    _dataBaseManager = DataBaseManager();
  }

  Future<void> _addNewCourse() async {
    bool authValidation = _formKey.currentState!.validate();
    bool retVal;
    print(authValidation);
    if (authValidation) {
      print("hii i get call");
      CoursesModelClass newCourse = CoursesModelClass(
          title: _courseNameController!.text.trim(),
          startDate: _startDateController!.text.trim(),
          endDate: _endDateController!.text.trim(),
          imagePath: _imagePathController!.text.trim());
      retVal = await _dataBaseManager!.insertCourseDetails(newCourse);
      if (retVal) {
        widget.mainSetState(() {
          ActiveScreen.SIGNUPSCREEN = false;
          ActiveScreen.HOMESCREEN = true;
          ActiveScreen.COURSECONTENTSCREEN = false;
          ActiveScreen.LOGINSCREEN = false;
          ActiveScreen.COURSESCREEN = false;
          ActiveScreen.ADDCOURSESCREEN = false;
          ActiveScreen.ADDCOURSECONTENTSCREEN = false;
          ActiveScreen.ADDCOURSECONTENTTOPICSCREEN = false;
          ActiveScreen.ADDADMINSCREEN = false;
          ActiveScreen.ADDSCREENNAVIGATOR = false;
        });
      }

      if (retVal) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Course Added Successful"),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Course Addedition Failed"),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Course Addedition Failed"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 23),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  child: Container(
                    height: 56,
                    width: 56,
                    child: const Icon(Icons.arrow_back_ios_new),
                  ),
                  onTap: () {
                    widget.mainSetState(() {
                      ActiveScreen.SIGNUPSCREEN = false;
                      ActiveScreen.HOMESCREEN = false;
                      ActiveScreen.COURSECONTENTSCREEN = false;
                      ActiveScreen.LOGINSCREEN = false;
                      ActiveScreen.COURSESCREEN = false;
                      ActiveScreen.ADDCOURSESCREEN = false;
                      ActiveScreen.ADDCOURSECONTENTSCREEN = false;
                      ActiveScreen.ADDCOURSECONTENTTOPICSCREEN = false;
                      ActiveScreen.ADDADMINSCREEN = false;
                      ActiveScreen.ADDSCREENNAVIGATOR = true;
                    });
                  },
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(right: 45),
                    alignment: Alignment.center,
                    child: Text(
                      "Add Course",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 48),
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(
                          16,
                          24,
                          40,
                          0.03,
                        ),
                        offset: Offset(0, 8),
                        blurRadius: 8,
                        spreadRadius: -4),
                    BoxShadow(
                        color: Color.fromRGBO(
                          16,
                          24,
                          40,
                          0.08,
                        ),
                        offset: Offset(0, 20),
                        blurRadius: 24,
                        spreadRadius: -4),
                  ]),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Course Name",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(
                                16, 24, 40, 0.05), // Shadow color
                            spreadRadius: 2, // Spread radius
                            blurRadius: 5, // Blur radius
                            offset:
                                Offset(0, 3), // Offset in x and y directions
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: _courseNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter course name";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintStyle: GoogleFonts.inter(
                              fontWeight: FontWeight.w400, fontSize: 14),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                // style: BorderStyle.none,
                                color: Color.fromRGBO(102, 112, 133, 1),
                                width: 0.2,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          hintText: 'Enter course name',
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Start Date",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(
                                16, 24, 40, 0.05), // Shadow color
                            spreadRadius: 2, // Spread radius
                            blurRadius: 5, // Blur radius
                            offset:
                                Offset(0, 3), // Offset in x and y directions
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: _startDateController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter start date";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintStyle: GoogleFonts.inter(
                              fontWeight: FontWeight.w400, fontSize: 14),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                // style: BorderStyle.none,
                                color: Color.fromRGBO(102, 112, 133, 1),
                                width: 0.2,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          hintText: 'Enter start date',
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "End Date",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(16, 24, 40, 0.05),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3)),
                        ],
                      ),
                      child: TextFormField(
                        controller: _endDateController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter End Date";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintStyle: GoogleFonts.inter(
                              fontWeight: FontWeight.w400, fontSize: 14),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                // style: BorderStyle.none,
                                color: Color.fromRGBO(102, 112, 133, 1),
                                width: 0.2,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          hintText: 'Enter End Date',
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Image Path",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(
                                16, 24, 40, 0.05), // Shadow color
                            spreadRadius: 2, // Spread radius
                            blurRadius: 5, // Blur radius
                            offset:
                                Offset(0, 3), // Offset in x and y directions
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: _imagePathController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter Image Path";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintStyle: GoogleFonts.inter(
                              fontWeight: FontWeight.w400, fontSize: 14),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                // style: BorderStyle.none,
                                color: Color.fromRGBO(102, 112, 133, 1),
                                width: 0.2,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          hintText: 'Enter Image Path',
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      thickness: 0.5,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Data you have added is immutable for now. so please kindly check the data you have entered.",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: const Color.fromRGBO(102, 112, 133, 1)),
                    )
                  ],
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(
                    left: 10, top: 18, right: 10, bottom: 18),
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 46, 150, 1),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Text(
                  "Proceed",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    textStyle: const TextStyle(
                      letterSpacing: 3,
                    ),
                  ),
                ),
              ),
              onTap: _addNewCourse,
            )
          ],
        ),
      ),
    );
  }
}
