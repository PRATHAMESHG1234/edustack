import 'package:edustack/config/constant.dart';
import 'package:edustack/config/model_classes.dart';
import 'package:edustack/pratik/course_content.dart';
import 'package:path/path.dart' show join;
import 'package:sqflite/sqflite.dart';

class DataBaseManager {
  dynamic database;

  DataBaseManager() {
    initializeDatabase();
  }

  Future<void> initializeDatabase() async {
    try {
      database = openDatabase(
          join(await getDatabasesPath(), DatabaseTableConstants.DBNAME),
          onCreate: _onCreate,
          version: 1);
    } catch (e) {
      print("Error initializing database: $e");
    }
  }

  Future<void> _onCreate(Database db, int version) async {
    print("hii here i am");
    try {
      await db.execute(DatabaseTableConstants.CREATE_USER_TABLE_QUERY);
      await db.execute(DatabaseTableConstants.CREATE_COURSE_TABLE_QUERY);
      await db.execute(DatabaseTableConstants.CREATE_TOPIC_CONTENT_TABLE_QUERY);
      await db.execute(
          DatabaseTableConstants.CREATE_COURSE_CONTENT_LIST_TABLE_QUERY);
    } catch (e) {
      print("Error creating table: $e");
    }
  }

  Future<bool> adminExists() async {
    final localDB = await database;
    try {
      List<Map<String, dynamic>> result = await localDB.query(
        DatabaseTableConstants.USERTABLENAME,
        where: 'IsAdmin = ?',
        whereArgs: [1],
      );
      return result.isNotEmpty;
    } catch (e) {
      print('Error checking admin existence: $e');
      return false;
    }
  }

  Future<bool> insertUser(UserModelClass user) async {
    try {
      final localDB = await database;

      await localDB.insert(
        DatabaseTableConstants.USERTABLENAME,
        user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      if (user.isAdmin != 1) {
        AppConstants.CURRENTUSER = user;
      }
      return true;
    } catch (e) {
      print("Error inserting user: $e");
      return false;
    }
  }

  Future<bool> checkUser({email, password}) async {
    List<UserModelClass> allUsers = await getAllUsers();

    bool isUser = false;

    for (var user in allUsers) {
      print(email);
      if (user.email == email && user.password == password) {
        AppConstants.CURRENTUSER = user;
        isUser = true;
        break;
      }
    }

    return isUser;
  }

  Future<List<UserModelClass>> getAllUsers() async {
    try {
      final localDB = await database;
      List<Map<String, dynamic>> allUsers = await localDB.query(
        DatabaseTableConstants.USERTABLENAME,
      );
      return List.generate(allUsers.length, (index) {
        Map map = allUsers[index];
        int id = map["id"];
        String name = map["name"];
        String email = map["email"];
        String password = map["password"];
        int isAdmin = map["isAdmin"];

        return UserModelClass(
            id: id,
            name: name,
            email: email,
            password: password,
            isAdmin: isAdmin);
      });
    } catch (e) {
      print("Error fetching all users: $e");
      return [];
    }
  }

  Future<void> deleteUser(int id) async {
    try {
      final localDB = await database;
      await localDB.delete(
        DatabaseTableConstants.USERTABLENAME,
        where: "id=?",
        whereArgs: [id],
      );
    } catch (e) {
      print("Error deleting user: $e");
    }
  }

  Future<bool> insertCourseDetails(CoursesModelClass course) async {
    try {
      final localDB = await database;
      int courseId = await localDB.insert(
        DatabaseTableConstants.COURSETABLENAME,
        course.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return true;
    } catch (e) {
      print("Error inserting user: $e");
      return false;
    }
  }

  Future<List<CoursesModelClass>> getAllCourses() async {
    try {
      final localDB = await database;
      List<Map<String, dynamic>> allCourses = await localDB.query(
        DatabaseTableConstants.COURSETABLENAME,
      );
      print(allCourses);
      return List.generate(allCourses.length, (index) {
        Map map = allCourses[index];
        int id = map["id"];
        String title = map["title"];
        String startDate = map["startDate"];
        String endDate = map["endDate"];
        String imagePath = map["imagePath"];

        return CoursesModelClass(
            id: id,
            title: title,
            startDate: startDate,
            endDate: endDate,
            imagePath: imagePath);
      });
    } catch (e) {
      print("Error fetching all Courses: $e");
      return [];
    }
  }

  Future<bool> insertCourseContent(CourseContentList course) async {
    try {
      final localDB = await database;
      int courseContentId = await localDB.insert(
        DatabaseTableConstants.COURSECONTENTLISTTABLENAME,
        course.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return true;
    } catch (e) {
      print("Error inserting course content: $e");
      return false;
    }
  }

  Future<List<CourseContentList>> getCourseContentListsByCourseId(
      int courseId) async {
    try {
      final localDB = await database;
      List<Map<String, dynamic>> allCourseContent = await localDB.query(
        DatabaseTableConstants.COURSECONTENTLISTTABLENAME,
        where: 'courseId = ?',
        whereArgs: [courseId],
      );

      return List.generate(allCourseContent.length, (index) {
        Map map = allCourseContent[index];
        int id = map["id"];
        int courseId = map["courseId"]; // Add courseId retrieval
        String title = map["title"];
        String description = map["description"];

        return CourseContentList(
          id: id,
          courseId: courseId,
          title: title,
          description: description,
        );
      });
    } catch (e) {
      print("Error fetching Course Content Lists by Course ID: $e");
      return [];
    }
  }

  Future<List<TopicContent>> getTopicContentByCourseContentId(
      int courseContentId) async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query(
        DatabaseTableConstants.TOPICCONTENTTABLENAME,
        where: 'courseContentId = ?',
        whereArgs: [courseContentId],
      );
      return List.generate(maps.length, (i) {
        return TopicContent(
          point: maps[i]['point'],
          explanation: maps[i]['explanation'],
          code: maps[i]['code'],
          courseContentId: courseContentId,
        );
      });
    } catch (error) {
      print("Error getting topic content by courseContentId: $error");
      return [];
    }
  }

  Future<bool> insertTopicContent(TopicContent topicContent) async {
    try {
      final localDB = await database;
      await localDB.insert(
        DatabaseTableConstants.TOPICCONTENTTABLENAME,
        topicContent.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return true;
    } catch (e) {
      print("Error inserting topic content: $e");
      return false;
    }
  }
}
