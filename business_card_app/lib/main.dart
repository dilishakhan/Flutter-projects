import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

/// Main App Widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        backgroundColor: Colors.teal.shade50,

        appBar: AppBar(
          title: Center(child: Text("Business Card")),

          backgroundColor: Colors.teal,

          elevation: 5,
        ),

        body: Center(
          child: Container(
            width: 350,

            padding: EdgeInsets.all(25),

            decoration: BoxDecoration(
              color: Colors.white,

              borderRadius: BorderRadius.circular(20),

              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                /// PROFILE IMAGE
                CircleAvatar(
                  radius: 60,

                  backgroundImage: AssetImage('assets/profile.jpeg'),
                ),

                SizedBox(height: 20),

                /// NAME
                Text(
                  "Dilisha",

                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade800,
                  ),
                ),

                SizedBox(height: 8),

                /// DESIGNATION
                Text(
                  "Flutter Developer",

                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade700,
                    letterSpacing: 1,
                  ),
                ),

                SizedBox(height: 25),

                Divider(thickness: 1.2),

                SizedBox(height: 20),

                /// NAME FIELD
                infoTile(Icons.person, "Name", "Dilisha"),

                SizedBox(height: 15),

                /// CONTACT FIELD
                infoTile(Icons.phone, "Contact Number", "+91 9876543210"),

                SizedBox(height: 15),

                /// EMAIL FIELD
                infoTile(Icons.email, "Email", "dilisha@example.com"),

                SizedBox(height: 15),

                /// LOCATION FIELD
                infoTile(Icons.location_on, "Location", "Bhopal, MP"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Reusable Info Tile
  Widget infoTile(IconData icon, String title, String value) {
    return Container(
      padding: EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: Colors.teal.shade50,

        borderRadius: BorderRadius.circular(12),

        border: Border.all(color: Colors.teal.shade100),
      ),

      child: Row(
        children: [
          Icon(icon, color: Colors.teal, size: 28),

          SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  "$title :",

                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),

                SizedBox(height: 3),

                Text(
                  value,

                  style: TextStyle(fontSize: 15, color: Colors.grey.shade800),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


//INSTAGRAM CLONE
/*import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Map<String, dynamic>> stories = [
    {"name": "aaryan.jpg", "color": Colors.orange},

    {"name": "itsme_rhea", "color": Colors.purple},

    {"name": "pixelpirate", "color": Colors.blue},

    {"name": "noodleninja", "color": Colors.green},

    {"name": "moonwalkerr", "color": Colors.red},

    {"name": "chai.overload", "color": Colors.teal},
  ];

  final List<Map<String, String>> suggestions = [
    {"name": "cloudyy.skies", "sub": "Followed by mutuals"},

    {"name": "retro.rider", "sub": "Suggested for you"},

    {"name": "sleepyowl.exe", "sub": "Followed by users"},

    {"name": "midnight.mango", "sub": "Suggested for you"},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        backgroundColor: Colors.white,

        body: Row(
          children: [
            // LEFT SIDEBAR
            Container(
              width: 85,

              padding: EdgeInsets.symmetric(vertical: 20),

              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.grey.shade300)),
              ),

              child: Column(
                children: [
                  Icon(
                    Icons.camera_alt_outlined,
                    size: 32,
                    color: Color(0xFF833AB4),
                  ),

                  SizedBox(height: 45),

                  sideIcon(Icons.home, true),
                  sideIcon(Icons.ondemand_video_outlined, false),
                  sideIcon(Icons.favorite_border, false),
                  sideIcon(Icons.search, false),
                  sideIcon(Icons.explore_outlined, false),
                  sideIcon(Icons.send_outlined, false),
                  sideIcon(Icons.add_box_outlined, false),

                  Spacer(),

                  // SIDEBAR PROFILE
                  CircleAvatar(
                    radius: 16,

                    backgroundImage: AssetImage('assets/profile.jpeg'),
                  ),

                  SizedBox(height: 30),

                  Icon(Icons.menu, size: 30),

                  SizedBox(height: 20),
                ],
              ),
            ),

            // CENTER FEED
            Expanded(
              child: Center(
                child: Container(
                  width: 650,

                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        SizedBox(height: 25),

                        // STORIES
                        Container(
                          height: 120,

                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,

                            itemCount: stories.length,

                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),

                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(3),

                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,

                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.purple,
                                            Colors.orange,
                                          ],
                                        ),
                                      ),

                                      child: CircleAvatar(
                                        radius: 35,

                                        backgroundColor:
                                            stories[index]["color"],
                                      ),
                                    ),

                                    SizedBox(height: 8),

                                    Text(
                                      stories[index]["name"],

                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),

                        SizedBox(height: 10),

                        // POST CARD
                        Center(
                          child: Container(
                            width: 470,

                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),

                              borderRadius: BorderRadius.circular(10),

                              color: Colors.white,
                            ),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                // POST HEADER
                                Padding(
                                  padding: EdgeInsets.all(12),

                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 18,

                                        backgroundImage: AssetImage(
                                          'assets/profile.jpeg',
                                        ),
                                      ),

                                      SizedBox(width: 10),

                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,

                                        children: [
                                          Text(
                                            "dilisha.exe",

                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                          Text(
                                            "MP, India • 2h",

                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),

                                      Spacer(),

                                      Icon(Icons.more_horiz),
                                    ],
                                  ),
                                ),

                                // POST IMAGE
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),

                                  child: Image.asset(
                                    'assets/profile.jpeg',

                                    height: 600,
                                    width: 470,

                                    fit: BoxFit.cover,
                                  ),
                                ),

                                // ACTION BUTTONS
                                Padding(
                                  padding: EdgeInsets.all(12),

                                  child: Row(
                                    children: [
                                      Icon(Icons.favorite_border, size: 28),

                                      SizedBox(width: 15),

                                      Icon(
                                        Icons.mode_comment_outlined,
                                        size: 26,
                                      ),

                                      SizedBox(width: 15),

                                      Icon(Icons.send_outlined, size: 26),

                                      Spacer(),

                                      Icon(Icons.bookmark_border, size: 28),
                                    ],
                                  ),
                                ),

                                // LIKES
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),

                                  child: Text(
                                    "8,932 likes",

                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                                SizedBox(height: 8),

                                // CAPTION
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),

                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(color: Colors.black),

                                      children: [
                                        TextSpan(
                                          text: "dilisha.exe ",

                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        TextSpan(text: "Exploring UI design!"),
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(height: 12),

                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),

                                  child: Text(
                                    "View all 284 comments",

                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),

                                SizedBox(height: 15),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // RIGHT PANEL
            Container(
              width: 380,

              padding: EdgeInsets.only(left: 20, right: 50, top: 30),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  // MAIN PROFILE
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 28,

                        backgroundImage: AssetImage('assets/profile.jpeg'),
                      ),

                      SizedBox(width: 12),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              "dilisha.exe",

                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),

                            Text(
                              "Dilisha.exe",

                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),

                      Text(
                        "Switch",

                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 35),

                  // SUGGESTIONS TITLE
                  Row(
                    children: [
                      Text(
                        "Suggested for you",

                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),

                      Spacer(),

                      Text(
                        "See all",

                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  // SUGGESTIONS
                  Column(
                    children: suggestions.asMap().entries.map((entry) {
                      int index = entry.key;
                      var user = entry.value;

                      return Padding(
                        padding: EdgeInsets.only(bottom: 18),

                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 22,

                              backgroundImage: AssetImage(
                                index == 0
                                    ? 'assets/profile1.jpg'
                                    : index == 1
                                    ? 'assets/profile2.jpeg'
                                    : index == 2
                                    ? 'assets/profile3.jpg'
                                    : 'assets/profile4.jpg',
                              ),
                            ),

                            SizedBox(width: 12),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Text(
                                    user["name"]!,

                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  Text(
                                    user["sub"]!,

                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Text(
                              "Follow",

                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sideIcon(IconData icon, bool active) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18),

      child: Icon(
        icon,
        size: 32,

        color: active ? Colors.black : Colors.black87,
      ),
    );
  }
}
*/