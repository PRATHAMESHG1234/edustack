import 'package:edustack/config/active_screens.dart';
import 'package:edustack/config/constant.dart';
import 'package:edustack/config/databse.dart';
import 'package:edustack/config/model_classes.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class AddCourseTopicContent extends StatefulWidget {
  final Function mainSetState;
  const AddCourseTopicContent({super.key, required this.mainSetState});

  @override
  State<AddCourseTopicContent> createState() => _AddCourseTopicContentState();
}

class _AddCourseTopicContentState extends State<AddCourseTopicContent> {
  TextEditingController? _topicNameController;
  TextEditingController? _explainationController;
  TextEditingController? _topicCodeController;
  DataBaseManager? _dataBaseManager;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _topicNameController = TextEditingController(text: "");
    _explainationController = TextEditingController();
    _topicCodeController = TextEditingController();
    _dataBaseManager = DataBaseManager();
  }

  Future<void> _addContentTopic() async {
    bool authValidation = _formKey.currentState!.validate();
    bool retVal;
    print(authValidation);
    print(_topicCodeController!.text.trim());
    print(_topicCodeController!.text);
    if (authValidation) {
      print("hii i get call");
      TopicContent newContentTopic = TopicContent(
          point: _topicNameController!.text.trim(),
          explanation: _explainationController!.text.trim(),
          code: _topicCodeController!.text.trim(),
          courseContentId: AppConstants.SELECTEDTOPIC!.id!);

      retVal = await _dataBaseManager!.insertTopicContent(newContentTopic);
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
            content: Text("Course Content Added Successful"),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Course Content Addedition Failed"),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Course Content Addedition Failed"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 23),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    child: const SizedBox(
                      height: 56,
                      width: 56,
                      child: Icon(Icons.arrow_back_ios_new),
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
                        "Add Topic Content",
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
                        "Topic Name",
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
                          controller: _topicNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter Topic Name";
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
                            hintText: 'Enter Topic Name',
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
                        "Explaination",
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
                          controller: _explainationController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter Explaination";
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
                            hintText: 'Enter Explaination',
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
                        "Code",
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
                          controller: _topicCodeController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter Code";
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
                            hintText: 'Enter Code',
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
              const SizedBox(
                height: 170,
              ),
              GestureDetector(
                onTap: _addContentTopic,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
