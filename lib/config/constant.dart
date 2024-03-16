// ignore_for_file: constant_identifier_names, non_constant_identifier_names
import "package:edustack/config/model_classes.dart";

class DatabaseTableConstants {
  static const CREATE_USER_TABLE_QUERY = '''
    CREATE TABLE IF NOT EXISTS $USERTABLENAME (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        isAdmin INTEGER DEFAULT 0
    )
    ''';
  static const CREATE_COURSE_TABLE_QUERY = '''
    CREATE TABLE IF NOT EXISTS $COURSETABLENAME (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        startDate TEXT NOT NULL,
        endDate TEXT NOT NULL,
        imagePath TEXT NOT NULL
    )
''';

  static const CREATE_COURSE_CONTENT_LIST_TABLE_QUERY = '''
    CREATE TABLE IF NOT EXISTS $COURSECONTENTLISTTABLENAME (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        courseId INTEGER NOT NULL,
        title TEXT NOT NULL,
        description TEXT NOT NULL,
        FOREIGN KEY(courseId) REFERENCES $COURSETABLENAME(id)
    )
''';

  static const CREATE_TOPIC_CONTENT_TABLE_QUERY = '''
    CREATE TABLE IF NOT EXISTS $TOPICCONTENTTABLENAME (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        courseContentId INTEGER NOT NULL,
        point TEXT NOT NULL,
        explanation TEXT NOT NULL,
        code TEXT NOT NULL,
        FOREIGN KEY(courseContentId) REFERENCES $COURSECONTENTLISTTABLENAME(id)
    )
''';

  static const DBNAME = "newmyEduStack.db";

  static const USERTABLENAME = "users";
  static const COURSETABLENAME = "courses";
  static const COURSECONTENTLISTTABLENAME = "course_contents";
  static const TOPICCONTENTTABLENAME = "topic_content";
}

class AppConstants {
  static RegExp EMAILREGEX = RegExp(r'^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$');

  static RegExp PASSWORDREGEX =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  static UserModelClass? CURRENTUSER;

  static int SELECTEDCOURSEID = -1;
  static int SELECTEDCONTENTEID = -1;
  static String SELECTEDCOURSETITLE = "";
}
