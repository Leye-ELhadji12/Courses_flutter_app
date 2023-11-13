import 'package:courses/Model/Course.dart';

class CoursesManager {
  List<Course> listCourses = [];

  void addCourse(Course course) {
    listCourses.add(course);
  }

  void deleteCourse(int index) {
    listCourses.removeAt(index);
  }

  /* 
  bool deleteCourse(int index) {
    if (index >= 0 && index < listCourses.length) {
      listCourses.removeAt(index);
      return true;
    }
    return false;
  }
  */

  List<Course> getlistCourses() => listCourses;
  
}