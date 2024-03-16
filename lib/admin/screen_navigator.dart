import 'package:edustack/config/active_screens.dart';
import 'package:edustack/config/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AddDataScreenSelectorForAdmin extends StatefulWidget {
  final Function mainSetState;
  const AddDataScreenSelectorForAdmin({super.key, required this.mainSetState});

  @override
  State<AddDataScreenSelectorForAdmin> createState() =>
      _AddDataScreenSelectorForAdminState();
}

class _AddDataScreenSelectorForAdminState
    extends State<AddDataScreenSelectorForAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 40.0, left: 23, right: 23, bottom: 20),
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
                  },
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: 45),
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
            const SizedBox(height: 20),
            Container(
                padding: const EdgeInsets.all(20),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "what do you want to add",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    Text(
                      "The following are information we want from you.",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color.fromRGBO(102, 112, 133, 1)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        height: 92,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromRGBO(234, 236, 240, 1),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        padding: EdgeInsets.only(left: 12, top: 10, bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(172, 194, 244, 1),
                                  border: Border.all(
                                      color: Color.fromRGBO(191, 210, 255, 1),
                                      width: 4),
                                  shape: BoxShape.circle),
                              child: Icon(
                                Icons.admin_panel_settings_sharp,
                                color: Color.fromRGBO(0, 46, 150, 1),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "New Admin",
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Color.fromRGBO(0, 46, 150, 1)),
                                ),
                                Container(
                                  width: 210,
                                  child: Text(
                                    "You are going to create new admin of your app",
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color:
                                            Color.fromRGBO(102, 112, 133, 1)),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
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
                          ActiveScreen.ADDADMINSCREEN = true;
                          ActiveScreen.ADDSCREENNAVIGATOR = false;
                        });
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        height: 92,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromRGBO(234, 236, 240, 1),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        padding: EdgeInsets.only(left: 12, top: 10, bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(172, 194, 244, 1),
                                  border: Border.all(
                                      color: Color.fromRGBO(191, 210, 255, 1),
                                      width: 4),
                                  shape: BoxShape.circle),
                              child: Icon(
                                Icons.layers_sharp,
                                color: Color.fromRGBO(0, 46, 150, 1),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "New Course",
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Color.fromRGBO(0, 46, 150, 1)),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 210,
                                    child: Text(
                                      "Provide the title,startdate,enddate and image",
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color:
                                              Color.fromRGBO(102, 112, 133, 1)),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        widget.mainSetState(() {
                          ActiveScreen.SIGNUPSCREEN = false;
                          ActiveScreen.HOMESCREEN = false;
                          ActiveScreen.COURSECONTENTSCREEN = false;
                          ActiveScreen.LOGINSCREEN = false;
                          ActiveScreen.COURSESCREEN = false;
                          ActiveScreen.ADDCOURSESCREEN = true;
                          ActiveScreen.ADDCOURSECONTENTSCREEN = false;
                          ActiveScreen.ADDCOURSECONTENTTOPICSCREEN = false;
                          ActiveScreen.ADDADMINSCREEN = false;
                          ActiveScreen.ADDSCREENNAVIGATOR = false;
                        });
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        height: 92,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromRGBO(234, 236, 240, 1),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        padding: EdgeInsets.only(left: 12, top: 10, bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(172, 194, 244, 1),
                                  border: Border.all(
                                      color: Color.fromRGBO(191, 210, 255, 1),
                                      width: 4),
                                  shape: BoxShape.circle),
                              child: Icon(
                                Icons.new_label_outlined,
                                color: Color.fromRGBO(0, 46, 150, 1),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Course Topic",
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Color.fromRGBO(0, 46, 150, 1)),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 210,
                                    child: Text(
                                      "Provide title of topic and description",
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color:
                                              Color.fromRGBO(102, 112, 133, 1)),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      onTap: (AppConstants.SELECTEDCOURSE != null)
                          ? () {
                              widget.mainSetState(() {
                                print(AppConstants.SELECTEDCOURSE);
                                ActiveScreen.SIGNUPSCREEN = false;
                                ActiveScreen.HOMESCREEN = false;
                                ActiveScreen.COURSECONTENTSCREEN = false;
                                ActiveScreen.LOGINSCREEN = false;
                                ActiveScreen.COURSESCREEN = false;
                                ActiveScreen.ADDCOURSESCREEN = false;
                                ActiveScreen.ADDCOURSECONTENTSCREEN = true;
                                ActiveScreen.ADDCOURSECONTENTTOPICSCREEN =
                                    false;
                                ActiveScreen.ADDADMINSCREEN = false;
                                ActiveScreen.ADDSCREENNAVIGATOR = false;
                              });
                            }
                          : () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      " For adding new Course Topic you firstly  need to be navigate in that course"),
                                ),
                              );
                            },
                    ),
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        height: 92,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromRGBO(234, 236, 240, 1),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        padding: EdgeInsets.only(left: 12, top: 10, bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(172, 194, 244, 1),
                                  border: Border.all(
                                      color: Color.fromRGBO(191, 210, 255, 1),
                                      width: 4),
                                  shape: BoxShape.circle),
                              child: Icon(
                                Icons.code_outlined,
                                color: Color.fromRGBO(0, 46, 150, 1),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Topic Content",
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Color.fromRGBO(0, 46, 150, 1)),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 210,
                                    child: Text(
                                      "Provide topic point,explaination and code of the topic",
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color:
                                              Color.fromRGBO(102, 112, 133, 1)),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      onTap: (AppConstants.SELECTEDTOPIC != null)
                          ? () {
                              print(AppConstants.SELECTEDTOPIC!.title);
                              widget.mainSetState(() {
                                ActiveScreen.SIGNUPSCREEN = false;
                                ActiveScreen.HOMESCREEN = false;
                                ActiveScreen.COURSECONTENTSCREEN = false;
                                ActiveScreen.LOGINSCREEN = false;
                                ActiveScreen.COURSESCREEN = false;
                                ActiveScreen.ADDCOURSESCREEN = false;
                                ActiveScreen.ADDCOURSECONTENTSCREEN = false;
                                ActiveScreen.ADDCOURSECONTENTTOPICSCREEN = true;
                                ActiveScreen.ADDADMINSCREEN = false;
                                ActiveScreen.ADDSCREENNAVIGATOR = false;
                              });
                            }
                          : () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      " For adding new Course Topic content you firstly  need to be navigate in that Topic Content"),
                                ),
                              );
                            },
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Data you have added is immutable for now. so please kindly check the data you have entered.",
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color.fromRGBO(102, 112, 133, 1)),
              ),
            ),
            Spacer(),
            GestureDetector(
              child: Container(
                alignment: Alignment.center,
                padding:
                    EdgeInsets.only(left: 10, top: 18, right: 10, bottom: 18),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 46, 150, 1),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Text(
                  "Proceed",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color.fromRGBO(255, 255, 255, 1),
                    textStyle: TextStyle(
                      letterSpacing: 3,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
