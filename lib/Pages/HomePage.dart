import 'package:courses/Model/Course.dart';
import 'package:courses/Model/CoursesManager.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CoursesManager coursesManager = CoursesManager();
  TextEditingController nameC = TextEditingController();
  TextEditingController descriptionC = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 212, 212),     
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 9, 67, 115),     
        title: const Text(
          'list of Courses',  
          style: TextStyle(
            fontWeight: FontWeight.w500,        
            fontSize: 25,
          ),
        ), 
        elevation: 2.8,     
        centerTitle: true,     
      ),
      body: Column(    
        children: [
          const SizedBox(height: 7,), 
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,  
                vertical: 20.0  
              ),     
              itemCount: coursesManager.getlistCourses().length,       
              itemBuilder: (context, index) {
                var course = coursesManager.getlistCourses()[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),   
                  child: ListTile(
                    minLeadingWidth: 10,      
                    //minVerticalPadding: 10,  
                    tileColor: Colors.white,    
                    shape: RoundedRectangleBorder(  
                      borderRadius: BorderRadius.circular(15),                
                      side: const BorderSide(color: Colors.black, width: 1.0),
                    ),
                    leading: const Icon(Icons.book),      
                    title: Text(
                      course.name,    
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(course.description),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,   
                      ),
                      onPressed: () {
                        setState(() {
                          coursesManager.deleteCourse(index);
                        });   
                      },
                    ),
                  ),
                );
              }, 
            ),
          ),
          //width: double.infinity, 
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 9, 67, 115),
              shadowColor: const Color.fromARGB(255, 9, 67, 115),
              padding: const EdgeInsets.symmetric(
                horizontal: 100.0,                
                vertical: 20.0      
              ),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),   
                  ),
                  title: const Text('New Course'),  
                  content: Column(
                    children: [
                      TextField(
                        controller: nameC,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 9, 67, 115),    
                          ),
                        ),
                      ),
                      TextField(
                        controller: descriptionC,
                        decoration: const InputDecoration(
                          labelText: 'Description', 
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 9, 67, 115),  
                          ),
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 9, 67, 115),
                      ),
                      onPressed: () {
                        setState(() {
                          coursesManager.addCourse(
                            Course(
                              name: nameC.text, 
                              description: descriptionC.text  
                            ),
                          );
                        });
                        Navigator.of(context).pop();
                      },
                      child: const Text('Add'),  
                    ),
                  ],
                ),
              );
            },
            child: const Text('Add'),  
          ),
          const SizedBox(height: 10,)  
        ],
      ),
    );
  }
}