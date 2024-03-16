import 'package:edustack/config/active_screens.dart';
import 'package:edustack/config/constant.dart';
import 'package:edustack/config/databse.dart';
import 'package:edustack/config/model_classes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "package:google_fonts/google_fonts.dart";

class Home extends StatefulWidget {
  final Function mainSetState;
  const Home({super.key, required this.mainSetState});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CoursesModelClass> courses = [];
  DataBaseManager? _dataBaseManager;
  @override
  void initState() {
    super.initState();
    print("////////////");
    _dataBaseManager = DataBaseManager();
    _getPrimaryData();
    AppConstants.SELECTEDCOURSE = null;
    AppConstants.SELECTEDTOPIC = null;
  }

  Future<void> _getPrimaryData() async {
    final localDb = await _dataBaseManager;

    List<CoursesModelClass> primarycourses = await localDb!.getAllCourses();
    setState(() {
      courses = primarycourses;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 120, left: 20, right: 10, bottom: 80),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(44, 55, 149, 0.57),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(157.5),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          child: Image.asset(
                            "assets/homeImage.png",
                          ),
                        ),
                        Text(
                          "Hi ${AppConstants.CURRENTUSER!.name}",
                          style: GoogleFonts.jost(
                              fontWeight: FontWeight.w700,
                              fontSize: 30,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Courses for you",
                        style: GoogleFonts.anekTamil(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            "View more",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          height: 231,
                          child: ListView.builder(
                              itemCount: courses.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    print(
                                        "djejennncncncnnccn${courses[index].title}");

                                    ActiveScreen.SIGNUPSCREEN = false;
                                    ActiveScreen.HOMESCREEN = false;
                                    ActiveScreen.COURSECONTENTSCREEN = false;
                                    ActiveScreen.LOGINSCREEN = false;
                                    ActiveScreen.COURSESCREEN = true;
                                    AppConstants.SELECTEDCOURSE =
                                        courses[index];

                                    widget.mainSetState(() {});
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    margin: const EdgeInsets.only(right: 10),
                                    height: 201,
                                    width: 183,
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [
                                              Color.fromRGBO(124, 132, 233, 1),
                                              Color.fromRGBO(219, 19, 19, 0.7),
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 52,
                                          child: Text(
                                            courses[index].title,
                                            style: GoogleFonts.anekTamil(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                        ),
                                        SizedBox(height: 6),
                                        SizedBox(
                                          height: 98,
                                          width: 134,
                                          child: Image.asset(
                                              courses[index].imagePath),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  const Row(
                    children: [],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "UpComing Courses",
                        style: GoogleFonts.anekTamil(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            "View more",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(top: 5, bottom: 10),
                          height: 157,
                          child: ListView.builder(
                              itemCount: courses.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    print("sudud");

                                    ActiveScreen.SIGNUPSCREEN = false;
                                    ActiveScreen.HOMESCREEN = false;
                                    ActiveScreen.COURSECONTENTSCREEN = false;
                                    ActiveScreen.LOGINSCREEN = false;
                                    ActiveScreen.COURSESCREEN = true;

                                    widget.mainSetState(() {});
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    padding: EdgeInsets.all(20),
                                    height: 157,
                                    width: 353,
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [
                                              Color.fromRGBO(141, 200, 242, 1),
                                              Color.fromRGBO(55, 21, 98, 0.8)
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  courses[index].startDate,
                                                  style: GoogleFonts.anekTamil(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  courses[index].endDate,
                                                  style: GoogleFonts.anekTamil(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                )
                                              ],
                                            ),
                                            Spacer(),
                                            Container(
                                              height: 50,
                                              width: 90,
                                              child: ElevatedButton(
                                                onPressed: () {},
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  backgroundColor: const Color
                                                      .fromRGBO(43, 137, 201,
                                                      1), // Background color
                                                  // Text color
                                                ),
                                                child: Text(
                                                  "Join ",
                                                  style: GoogleFonts.anekTamil(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 19,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Center(
                                            child: Text(
                                          courses[index].title,
                                          style: GoogleFonts.anekTamil(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 30,
                                              color: Colors.white),
                                        ))
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: (AppConstants.CURRENTUSER!.isAdmin == 1)
          ? FloatingActionButton(
              onPressed: () {
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
              child: Icon(Icons.add),
            )
          : null,
    );
  }
}
