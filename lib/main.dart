import 'package:edustack/Authentication/login.dart';
import 'package:edustack/admin/add_course.dart';
import 'package:edustack/admin/add_course_content.dart';
import 'package:edustack/admin/add_course_topic_content.dart';
import 'package:edustack/admin/give_admin_access.dart';
import 'package:edustack/admin/screen_navigator.dart';
import 'package:edustack/config/constant.dart';

import 'package:edustack/home.dart';
import 'package:edustack/config/active_screens.dart';
import 'package:edustack/pratik/course.dart';
import 'package:edustack/pratik/course_content.dart';
import 'package:flutter/material.dart';

void main() async {
  ActiveScreen.LOGINSCREEN = true;
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget? getActiveScreen() {
    print("**********${ActiveScreen.COURSESCREEN}");
    if (ActiveScreen.LOGINSCREEN) {
      return Login(isSignup: false, mainSetState: setState);
    } else if (ActiveScreen.SIGNUPSCREEN) {
      return Login(isSignup: true, mainSetState: setState);
    } else if (ActiveScreen.HOMESCREEN) {
      return Home(mainSetState: setState);
    } else if (ActiveScreen.COURSESCREEN) {
      return Edutask(mainSetState: setState);
    } else if (ActiveScreen.COURSECONTENTSCREEN) {
      return CourseContent(mainSetState: setState);
    } else if (ActiveScreen.ADDCOURSESCREEN &&
        AppConstants.CURRENTUSER!.isAdmin == 1) {
      return AddCourse(mainSetState: setState);
    } else if (ActiveScreen.ADDCOURSECONTENTSCREEN &&
        AppConstants.CURRENTUSER!.isAdmin == 1) {
      return AddCourseContent(mainSetState: setState);
    } else if (ActiveScreen.ADDCOURSECONTENTTOPICSCREEN &&
        AppConstants.CURRENTUSER!.isAdmin == 1) {
      return AddCourseTopicContent(mainSetState: setState);
    } else if (ActiveScreen.ADDADMINSCREEN &&
        AppConstants.CURRENTUSER!.isAdmin == 1) {
      return GiveAdminAccess(mainSetState: setState);
    } else if (ActiveScreen.ADDSCREENNAVIGATOR &&
        AppConstants.CURRENTUSER!.isAdmin == 1) {
      return AddDataScreenSelectorForAdmin(mainSetState: setState);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: getActiveScreen(),
    );
  }
}
