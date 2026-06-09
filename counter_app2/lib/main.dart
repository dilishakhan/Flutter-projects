/*import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0;

  Color counterColor = Colors.deepPurple;

  void incrementCounter() {
    setState(() {
      count++;

      // Change color every 10 clicks

      if (count % 10 == 0) {
        if (counterColor == Colors.deepPurple) {
          counterColor = Colors.red;
        } else if (counterColor == Colors.red) {
          counterColor = Colors.green;
        } else if (counterColor == Colors.green) {
          counterColor = Colors.orange;
        } else {
          counterColor = Colors.deepPurple;
        }
      }
    });
  }

  void resetCounter() {
    setState(() {
      count = 0;

      counterColor = Colors.deepPurple;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        // Very light pale purple background
        backgroundColor: Color(0xFFF4EEFF),

        appBar: AppBar(
          backgroundColor: Colors.deepPurple,

          centerTitle: true,

          title: Text(
            "COUNTER APP 2.0",

            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              letterSpacing: 2,
              color: Colors.white,
            ),
          ),
        ),

        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(
                  "Tap Counter",

                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),

                SizedBox(height: 40),

                // Counter Box
                Container(
                  height: 180,
                  width: 250,

                  decoration: BoxDecoration(
                    color: Colors.white,

                    border: Border.all(color: counterColor, width: 6),

                    borderRadius: BorderRadius.circular(25),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 12,
                        spreadRadius: 2,
                        offset: Offset(4, 4),
                      ),
                    ],
                  ),

                  child: Center(
                    child: Text(
                      "$count",

                      style: TextStyle(
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                        color: counterColor,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 50),

                ElevatedButton(
                  onPressed: incrementCounter,

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,

                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),

                  child: Text(
                    "Increase Counter",

                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: resetCounter,

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,

                    padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),

                  child: Text(
                    "Reset",

                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/

// TODO LIST UI

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController taskController = TextEditingController();

  List<String> tasks = [];

  void addTask() {
    if (taskController.text.isNotEmpty) {
      setState(() {
        tasks.add(taskController.text);

        taskController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        // Soft lavender background
        backgroundColor: Color(0xFFF8F5FF),

        appBar: AppBar(
          elevation: 0,

          backgroundColor: Colors.deepPurple,

          centerTitle: true,

          title: Text(
            "TO-DO LIST",

            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              color: Colors.white,
            ),
          ),
        ),

        body: Padding(
          padding: EdgeInsets.all(20),

          child: Column(
            children: [
              // Top Welcome Card
              Container(
                width: double.infinity,

                padding: EdgeInsets.all(20),

                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.deepPurple, Colors.purpleAccent],
                  ),

                  borderRadius: BorderRadius.circular(25),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.shade100,
                      blurRadius: 12,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      "Stay Organized!",

                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: 8),

                    Text(
                      "Add your daily tasks below",

                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 25),

              // Input Field
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(18),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(2, 4),
                    ),
                  ],
                ),

                child: TextField(
                  controller: taskController,

                  style: TextStyle(fontSize: 18),

                  decoration: InputDecoration(
                    hintText: "Enter your task...",

                    hintStyle: TextStyle(color: Colors.grey),

                    prefixIcon: Icon(
                      Icons.edit_note,
                      color: Colors.deepPurple,
                      size: 28,
                    ),

                    border: InputBorder.none,

                    contentPadding: EdgeInsets.symmetric(vertical: 20),
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Add Task Button
              SizedBox(
                width: double.infinity,

                height: 55,

                child: ElevatedButton(
                  onPressed: addTask,

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,

                    elevation: 6,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Icon(Icons.add, color: Colors.white),

                      SizedBox(width: 10),

                      Text(
                        "ADD TASK",

                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 25),

              // Task Counter
              Align(
                alignment: Alignment.centerLeft,

                child: Text(
                  "Tasks (${tasks.length})",

                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ),

              SizedBox(height: 15),

              // Task List
              Expanded(
                child: tasks.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Icon(
                              Icons.task_alt,
                              size: 90,
                              color: Colors.deepPurple.shade200,
                            ),

                            SizedBox(height: 15),

                            Text(
                              "No Tasks Yet",

                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),

                            SizedBox(height: 5),

                            Text(
                              "Add tasks to get started",

                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: tasks.length,

                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 18),

                            decoration: BoxDecoration(
                              color: Colors.white,

                              borderRadius: BorderRadius.circular(20),

                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 8,
                                  offset: Offset(2, 4),
                                ),
                              ],
                            ),

                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),

                              leading: Container(
                                height: 45,
                                width: 45,

                                decoration: BoxDecoration(
                                  color: Colors.deepPurple,

                                  borderRadius: BorderRadius.circular(12),
                                ),

                                child: Center(
                                  child: Text(
                                    "${index + 1}",

                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),

                              title: Text(
                                tasks[index],

                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              trailing: Icon(
                                Icons.check_circle,
                                color: Colors.green,
                                size: 30,
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
