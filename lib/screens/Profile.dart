import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodproject/screens/LoginTab.dart';
import 'package:image_picker/image_picker.dart';

import '../Widgets/image_widget.dart';

class Profile extends StatefulWidget {
  static const String id = 'profile';
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    getCurrentUser();
    getUsers();
  }

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  late User loggedInUser;
  late String username = '';

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  void getUsers() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if (doc["email"] == loggedInUser.email) {
          username = doc["username"];
          print(doc["username"]);
        }
      });
    });
  }

  var image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Spacer(),
                image != null
                    ? ImageWidget(
                        image, (source) => pickImage(ImageSource.gallery))
                    : username == 'Maryem Jaouadi'
                        ? ClipOval(
                            child: Image.asset(
                            'images/maryem2.jpg',
                            width: 160,
                            height: 160,
                          ))
                        : GestureDetector(
                            child: ClipOval(
                              child: Material(
                                  color: Colors.transparent,
                                  child: Image.asset(
                                    'images/noprofilepic.jpg',
                                    height: 160,
                                    width: 160,
                                    fit: BoxFit.fill,
                                  )),
                            ),
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        'Please pick a method to choose a picture'),
                                    backgroundColor:
                                        Colors.grey.withOpacity(0.7)),
                              );
                            }),

                SizedBox(
                  height: 20.0,
                ),
                BuildButton('pick from gallery', Icons.photo,
                    () => pickImage(ImageSource.gallery)),
                SizedBox(
                  height: 20.0,
                ),
                BuildButton('pick from camera', Icons.camera_alt_outlined,
                    () => pickImage(ImageSource.camera)),
                SizedBox(
                  height: 20.0,
                ),
                BuildButton('Log Out', Icons.logout, () async {
                  await _auth.signOut();
                  Navigator.pushNamed(context, LoginTab.id);
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BuildButton extends StatelessWidget {
  BuildButton(this.title, this.icon, this.onClicked);

  final String title;
  final IconData icon;
  final VoidCallback onClicked;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(56),
        primary: Colors.white,
        onPrimary: Colors.black,
        textStyle: TextStyle(fontSize: 20.0),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 28.0,
          ),
          const SizedBox(
            width: 16,
          ),
          Text(title),
        ],
      ),
      onPressed: onClicked,
    );
  }
}
