class UserModelClass {
  int? id;
  String name;
  String email;
  String password;
  int isAdmin;

  UserModelClass({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.isAdmin,
  });

  Map<String, dynamic> toMap() =>
      {'Name': name, 'Email': email, "Password": password, "IsAdmin": isAdmin};
}

class CoursesModelClass {
  int? id;
  String title;
  String startDate;
  String endDate;
  String imagePath;

  CoursesModelClass({
    this.id,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.imagePath,
  });

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "startDate": startDate,
        "endDate": endDate,
        "imagePath": imagePath,
      };
}

class CourseContentList {
  int? id;
  final int courseId;
  final String title;
  final String description;

  CourseContentList({
    this.id,
    required this.courseId,
    required this.title,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'courseId': courseId,
      'title': title,
      'description': description,
    };
  }
}

class TopicContent {
  int? id;
  final int courseContentId;
  String point;
  String explanation;
  String code;

  TopicContent({
    this.id,
    required this.courseContentId,
    required this.point,
    required this.explanation,
    required this.code,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'courseContentId': courseContentId,
      'point': point,
      'explanation': explanation,
      'code': code,
    };
  }
}
