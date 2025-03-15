import 'package:flutter/material.dart';

void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserInfo userInfo = UserInfo(
      name: 'Tadashi Hamada',
      major: 'Robotics ',
      university: 'San Fransokyo Tech,',
      phone: '+1 (123) 456-7890',
      email: 'tadashi.baymax@example.com',
      address: 'Lucky Cat Café',
      education: [
        EducationInfo(
          universityName: 'San Fransokyo Tech',
          gpa: 3.8,
          logo: 'assets/images/uni1.webp',
        ),
        EducationInfo(
          universityName: 'San Fransokyo High',
          gpa: 4.0,
          logo: 'assets/images/uni2.jpeg',
        ),
      ],
      projects: [
        ProjectInfo(
          projectName: 'BayMax',
          imageUrl: 'assets/images/baymax.jpeg',
        ),
        ProjectInfo(
          projectName: 'Snow Machine',
          imageUrl: 'assets/images/snowmachine.jpeg',
        ),
        ProjectInfo(
          projectName: 'Holo Pet 2.0',
          imageUrl: 'assets/images/holopet.png',
        ),
        ProjectInfo(
          projectName: 'Holo Pet',
          imageUrl: 'assets/images/holopet.png',
        ),
      ],
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(230, 107, 2, 11),
          title: Text('Profile Page'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Profile pic and details
                Row(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Tadashi.jpg',
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          userInfo.name,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${userInfo.major}',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '${userInfo.university}',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 24),

                // Contact info
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text(userInfo.phone),
                ),
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text(userInfo.email),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text(userInfo.address),
                ),

                SizedBox(height: 24),

                // Edu
                Text(
                  'Education',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: userInfo.education.map((edu) {
                    return Row(
                      children: <Widget>[
                        Image.asset(
                          edu.logo,
                          width: 80,
                          height: 80,
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              edu.universityName,
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'GPA: ${edu.gpa.toString()}',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }).toList(),
                ),

                SizedBox(height: 24),

                // projects
                Text(
                  'Projects',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: userInfo.projects.map((project) {
                    return Column(
                      children: <Widget>[
                        Image.asset(
                          project.imageUrl,
                          width: 100,
                          height: 100,
                        ),
                        SizedBox(height: 3),
                        Text(
                          project.projectName,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserInfo {
  final String name;
  final String major;
  final String university;
  final String phone;
  final String email;
  final String address;
  final List<EducationInfo> education;
  final List<ProjectInfo> projects;

  UserInfo({
    required this.name,
    required this.major,
    required this.university,
    required this.phone,
    required this.email,
    required this.address,
    required this.education,
    required this.projects,
  });
}

class EducationInfo {
  final String universityName;
  final double gpa;
  final String logo;

  EducationInfo({
    required this.universityName,
    required this.gpa,
    required this.logo,
  });
}

class ProjectInfo {
  final String projectName;
  final String imageUrl;

  ProjectInfo({
    required this.projectName,
    required this.imageUrl,
  });
}
