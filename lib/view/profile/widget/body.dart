// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sole_quest/theme/custom_app_theme.dart';

import '../../../../animation/fadeanimation.dart';
import '../../../../models/models.dart';
import '../../../../utils/constants.dart';
import '../../../../view/profile/widget/repeated_list.dart';
import '../../../data/dummy_data.dart';

class BodyProfile extends StatefulWidget {
  const BodyProfile({Key? key}) : super(key: key);

  @override
  _BodyProfileState createState() => _BodyProfileState();
}

class _BodyProfileState extends State<BodyProfile> {
  int statusCurrentIndex = 0;

  // Get the current user id
  final String documentId = FirebaseAuth.instance.currentUser!.uid;

  List<String> userInfo = [];

  Logout() async {
    FirebaseAuth.instance.signOut().then((value) {
      Navigator.pushReplacementNamed(context, '/login');
    });
    // Clear userInfo from SharedPreferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userInfo');
  }

  @override
  void initState() {
    super.initState();
    _getUserInfoFromSharedPreferences();
  }

  Future<void> _getUserInfoFromSharedPreferences() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String>? userData = prefs.getStringList('userInfo');
      if (userData != null) {
        setState(() {
          userInfo = userData;
        });
      }
    } catch (e) {
      print('Error getting user info from SharedPreferences: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return userInfo.isEmpty
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                topProfilePicAndName(),
                middleDashboard(),
                bottomSection(),
              ],
            ),
          );
  }

  // Top Profile Photo And Name Components
  topProfilePicAndName() {
    return FadeAnimation(
      delay: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                "https://avatars.githubusercontent.com/u/91388754?v=4"),
          ),
          SizedBox(
            width: 20,
          ),
          Text(userInfo[0], style: AppThemes.profileDevName),
          Text(
            userInfo[1],
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.w500, color: Colors.grey),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            userInfo[2],
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                fontStyle: FontStyle.italic),
          ),
          TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(0)),
              ),
              onPressed: () {},
              child: Text(
                "Edit Profile",
                style: TextStyle(
                  color: Colors.blue[600],
                  fontSize: 17,
                ),
              )),
        ],
      ),
    );
  }

  // Middle Status List View Components
  middleStatusListView() {
    return FadeAnimation(
      delay: 1.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              "My Status",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontSize: 15),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Center(
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: userStatus.length,
                itemBuilder: (ctx, index) {
                  UserStatus status = userStatus[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        statusCurrentIndex = index;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        margin: EdgeInsets.all(5),
                        width: 120,
                        decoration: BoxDecoration(
                          color: statusCurrentIndex == index
                              ? status.selectColor
                              : status.unSelectColor,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              status.emoji,
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              status.txt,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppConstantsColor.lightTextColor,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  // Middle Dashboard ListTile Components
  middleDashboard() {
    return FadeAnimation(
      delay: 2,
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Dashboard",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.green[600],
                      ),
                      child: Icon(
                        Icons.wallet_travel_outlined,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Payments",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                          fontSize: 16),
                    ),
                  ],
                ),
                Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue[700],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "2 New",
                        style: TextStyle(
                            color: AppConstantsColor.lightTextColor,
                            fontWeight: FontWeight.w500),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppConstantsColor.lightTextColor,
                        size: 15,
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.grey[400],
                      ),
                      child: Icon(
                        Icons.shield,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Privacy",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                          fontSize: 16),
                    ),
                  ],
                ),
                Container(
                  width: 130,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red[500],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Action Needed",
                        style: TextStyle(
                            color: AppConstantsColor.lightTextColor,
                            fontWeight: FontWeight.w500),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppConstantsColor.lightTextColor,
                        size: 15,
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.yellow[600],
                      ),
                      child: Icon(
                        Icons.archive,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Acheivements",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                          fontSize: 16),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppConstantsColor.darkTextColor,
                  size: 15,
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  // My Account Section Components
  bottomSection() {
    return FadeAnimation(
      delay: 2.5,
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Account",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontSize: 15),
            ),
            SizedBox(
              height: 15,
            ),
            TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(0)),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Text(
                "Switch to Other Account",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.blue[600],
                    fontSize: 17),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(0)),
              ),
              onPressed: () {
                _showConfirmationDialog(
                    context, 'Are you sure you want to log out?');
              },
              child: Text(
                "Log Out",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.red[600],
                    fontSize: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Logout'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Logout();
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}
