import 'package:edustack/config/active_screens.dart';
import 'package:edustack/config/constant.dart';
import 'package:edustack/config/databse.dart';
import 'package:edustack/config/model_classes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Edutask extends StatefulWidget {
  final Function mainSetState;
  const Edutask({super.key, required this.mainSetState});
  State createState() => _EdutaskState();
}

bool courseflag = true;

// List<TopicContent> topicContentList = [
//   TopicContent(
//     point: "Introduction To Java",
//     explaination:
//         'Java is a high-level, object-oriented programming language developed by Sun Microsystems (now owned by Oracle Corporation). It was first released in 1995 and has since become one of the most popular programming languages worldwide, particularly for building enterprise-scale applications.',
//     code: '''
//            class Test
//           {
//             public static void main(String []args)
//             {
//               System.out.println("My First Java Program.");
//             }
//           };
//             ''',
//   ),
//   TopicContent(
//       point: 'What is Java',
//       explaination: "Java is Platform Independent",
//       code:
//           '''Java is considered platform independent because of its "write once, run anywhere" (WORA) philosophy. This principle allows Java programs to be developed on one platform (e.g., Windows) and executed on any other platform (e.g., Linux or macOS) without modification.''')
// ];

List<CourseContentList> courcedetails = [
  // CourseContentList(
  //   title: "Introduction to Java.",
  //   description:
  //       "Java is a widely used object-oriented programming language and software platform that runs on billions of devices, including notebook computers, mobile devices, gaming consoles, medical devices and many others. The rules and syntax of Java are based on the C and C++ languages.",
  // ),
  // CourseContentList(
  //   title: "Consecative and destructive",
  //   description:
  //       '''Consecutive: This term typically relates to sequential or successive execution of operations or actions. In the context of Java programming, "consecutive" doesn't have a specific meaning on its own. It might be used in various contexts to describe a series of actions, iterations, or events that occur one after the other without interruption.
  //   Destructive: In Java, "destructive" commonly refers to operations or methods that modify or alter the original data or object. For example, if you have a list and you apply a method that removes elements from the list, that operation is considered destructive because it changes the state of the original list. In contrast, non-destructive operations might return a new object or collection without modifying the original.
  //         ''',
  // ),
];

class _EdutaskState extends State<Edutask> {
  DataBaseManager? _dataBaseManager;
  @override
  void initState() {
    super.initState();
    print("////////////");
    _dataBaseManager = DataBaseManager();
    _getPrimaryData();
    AppConstants.SELECTEDTOPIC = null;
  }

  Future<void> _getPrimaryData() async {
    final localDb = await _dataBaseManager;
    List<CourseContentList> primarycourses = await localDb!
        .getCourseContentListsByCourseId(AppConstants.SELECTEDCOURSE!.id!);
    setState(() {
      courcedetails = primarycourses;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(courcedetails);
    return DisplayCources();
  }

  Widget DisplayCources() {
    if (courseflag) {
    } else {}
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(93, 108, 244, 0.67),
            Color.fromRGBO(162, 14, 23, 0.67)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 70, left: 10, bottom: 50, right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                ActiveScreen.SIGNUPSCREEN = false;
                                ActiveScreen.HOMESCREEN = true;
                                ActiveScreen.COURSECONTENTSCREEN = false;
                                ActiveScreen.LOGINSCREEN = false;
                                ActiveScreen.COURSESCREEN = false;

                                widget.mainSetState(() {});
                              });
                            },
                            child: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              AppConstants.SELECTEDCOURSE!.title,
                              style: GoogleFonts.anekTamil(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 40,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 1,
                  ),
                  Container(
                    height: 136,
                    width: 136,
                    padding: const EdgeInsets.all(7),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(194, 255, 197, 1),
                            Color.fromRGBO(62, 35, 232, 1),
                            Color.fromRGBO(0, 0, 0, 1)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(AppConstants.SELECTEDCOURSE!.imagePath),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: ListView.builder(
                  itemCount: courcedetails.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 17),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 2.0),
                        padding: const EdgeInsets.all(20.0),
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(226, 222, 234, 1),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.25),
                              blurRadius: 10,
                              spreadRadius: 0,
                              offset: Offset(10, 10),
                            ),
                          ],
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              courcedetails[index].title,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              courcedetails[index].description.length > 96
                                  ? courcedetails[index]
                                          .description
                                          .substring(0, 97) +
                                      ' ...'
                                  : courcedetails[index].description,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  ActiveScreen.SIGNUPSCREEN = false;
                                  ActiveScreen.HOMESCREEN = false;
                                  ActiveScreen.COURSECONTENTSCREEN = true;
                                  ActiveScreen.LOGINSCREEN = false;
                                  ActiveScreen.COURSESCREEN = false;

                                  widget.mainSetState(() {
                                    AppConstants.SELECTEDTOPIC =
                                        courcedetails[index];
                                  });
                                });
                              },
                              child: Container(
                                color: Colors.transparent,
                                child: const Row(
                                  children: [
                                    Text(
                                      "View More",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
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
