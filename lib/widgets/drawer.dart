// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageurl = "https://img.freepik.com/free-vector/flat-creativity-concept-illustration_52683-64279.jpg?t=st=1655567788~exp=1655568388~hmac=c4837a68da6c22cea45103699a62237f80f37b6876f0b6e6dee1c0ce6c651e55&w=826";
    return Drawer(
      child: Container(
         decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                color: Color.fromARGB(255, 70, 36, 172),
              ),
                accountName: Text("Rajat Khoware"),
                accountEmail: Text("rajatkhoware2002@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageurl),)
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home, color: Colors.white,),
                title: Text("Home",
                style: TextStyle(
                  color: Colors.white),
                  textScaleFactor: 1.2,),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled, color: Colors.white,),
                title: Text("Profile",
                style: TextStyle(
                  color: Colors.white),
                  textScaleFactor: 1.2,),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.phone, color: Colors.white,),
                title: Text("Contact Us",
                style: TextStyle(
                  color: Colors.white),
                  textScaleFactor: 1.2,),
            ),
          ],
        ),
      ),
    );
  }
}
