import 'package:edustack/config/active_screens.dart';
import 'package:edustack/config/constant.dart';
import 'package:edustack/config/databse.dart';
import 'package:edustack/config/model_classes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseContent extends StatefulWidget {
  final Function mainSetState;
  const CourseContent({super.key, required this.mainSetState});

  @override
  State<CourseContent> createState() => _CourseContentState();
}

List<TopicContent> topicContentList = [
  // TopicContent(
  //   point: "Introduction To Java",
  //   explanation:
  //       'Java is a high-level, object-oriented programming language developed by Sun Microsystems (now owned by Oracle Corporation). It was first released in 1995 and has since become one of the most popular programming languages worldwide, particularly for building enterprise-scale applications.',
  //   code: '''
  //          class Test
  //         {
  //           public static void main(String []args)
  //           {
  //             System.out.println("My First Java Program.");
  //           }
  //         };
  //           ''',
  // ),
  // TopicContent(
  //     point: 'What is Java',
  //     explanation: "Java is Platform Independent",
  //     code: '''
  //          class Test
  //         {
  //           public static void main(String []args)
  //           {
  //             System.out.println("My First Java Program.");
  //           }
  //         };
  //           ''')
];

class _CourseContentState extends State<CourseContent> {
  DataBaseManager? _dataBaseManager;
  @override
  void initState() {
    super.initState();
    print("////////////");
    _dataBaseManager = DataBaseManager();
    _getPrimaryData();
  }

  Future<void> _getPrimaryData() async {
    final localDb = await _dataBaseManager;
    List<TopicContent> primarycourses = await localDb!
        .getTopicContentByCourseContentId(AppConstants.SELECTEDCONTENTEID);
    setState(() {
      topicContentList = primarycourses;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(93, 108, 244, 0.67),
            Color.fromRGBO(162, 14, 23, 0.67)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                                ActiveScreen.HOMESCREEN = false;
                                ActiveScreen.COURSECONTENTSCREEN = false;
                                ActiveScreen.LOGINSCREEN = false;
                                ActiveScreen.COURSESCREEN = true;

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
                              AppConstants.SELECTEDCOURSETITLE,
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
                  const SizedBox(
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
                    child: Image.asset("assets/java.png"),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 8, right: 8, top: 40),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: ListView.builder(
                  itemCount: topicContentList.length,
                  itemBuilder: (context, index) {
                    print("-----------${topicContentList[index].point}");
                    return Container(
                      padding: EdgeInsets.all(5),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  topicContentList[index].point,
                                  style: GoogleFonts.anekTamil(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              topicContentList[index].explanation,
                              style: GoogleFonts.anekTamil(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: const BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.circle),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Code",
                                  style: GoogleFonts.anekTamil(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(217, 217, 217, 1),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Text(
                                topicContentList[index].code,
                                style: GoogleFonts.anekTamil(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
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
              onPressed: () {},
              child: Icon(Icons.add),
            )
          : null,
    );
  }
}
