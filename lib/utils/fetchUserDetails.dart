import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FetchUserDetails extends StatefulWidget {
  const FetchUserDetails({Key? key}) : super(key: key);

  @override
  State<FetchUserDetails> createState() => _FetchUserDetailsState();
}

class _FetchUserDetailsState extends State<FetchUserDetails> {
  List<String> userInfo = [];

  @override
  void initState() {
    super.initState();
    fetchAndSaveUserInfo();
    print('User info: $userInfo');
  }

  Future<void> fetchAndSaveUserInfo() async {
    final user = FirebaseAuth.instance.currentUser;
    String? documentId = user?.uid;
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      DocumentSnapshot documentSnapshot = await users.doc(documentId).get();

      if (documentSnapshot.exists) {
        List<String> mydata = [];
        mydata.add(documentSnapshot.get('username'));
        mydata.add(documentSnapshot.get('email'));
        mydata.add(documentSnapshot.get('city'));
        setState(() {
          userInfo = mydata;
        });

        // Save userInfo to SharedPreferences
        await saveUserInfoToSharedPreferences(userInfo);
      } else {
        print('Document does not exist on the database');
      }
    } catch (e) {
      print('Error fetching user info: $e');
    }
  }

  Future<void> saveUserInfoToSharedPreferences(List<String> userInfo) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('userInfo', userInfo);
    } catch (e) {
      print('Error saving user info to SharedPreferences: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
