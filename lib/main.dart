import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:purematch/widgets.dart';
import 'package:searchable_listview/searchable_listview.dart';

/*
 The assets Images file weren't kept here but were saved on my Google Drive
 but were later moved here to avoid network issues
 Ronald Kelechi. No widget file was used cause of there wwas no need i did it 
file .
*/

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: screen()));
}

class screen extends StatefulWidget {
  const screen({Key? key}) : super(key: key);

  @override
  _screenState createState() => _screenState();
}

class _screenState extends State<screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
            padding: const EdgeInsets.all(2.0),
            onPressed: () {
              print("It is working");
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        // Title Text
        title: Container(
          child: const Text(
            "Add an Admin",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      backgroundColor: Colors.grey[900],

      body: ExampleApp(),
    );
  }
}

class EmptyView extends StatelessWidget {
  const EmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.error,
            color: Colors.white,
          ),
          Text(
            'No Admin is found with this name',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );
  }
}

class Admin {
  String profilePic;
  String fullname;
  String joiningdate;
  int color;
 

  Admin({
    required this.profilePic,
    required this.fullname,
    required this.joiningdate,
    required this.color,
  });
}

// THIS IS THE CLASS THAT DESCRIBES THE ADMIN ITEM LAYOUT
class AdminItem extends StatelessWidget {
  final Admin admin;
  const AdminItem({
    Key? key,
    required this.admin,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            // First Column
            Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(admin.color)),
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(admin.profilePic)),
                    ),
                  ),
                ),
              ],
            ),

            // Second Column
            Column(
              children: [
                Container(
                  width: 150,
                  margin: const EdgeInsets.only(
                    top: 0,
                    left: 40,
                    right: 10,
                  ),
                  child: Column(
                    children: [
                      Text(
                        admin.fullname,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 150,
                  margin: const EdgeInsets.only(
                    top: 10,
                    left: 50,
                    right: 10,
                  ),
                  child: Column(
                    children: [
                      Text(
                        admin.joiningdate,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Third Column
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 100),
                  child: const Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ExampleApp extends StatelessWidget {
  List graphic = ["black_young_man.jpg", "hot_girl.jpg"];
  //  Please leave it it kept on giving error's ronald kelechi
  final List<Admin> admin = [
    Admin(
      color: 0xFF00BFA5,
      profilePic: 'wird_dude.jpg',
      fullname: 'Ivan Decaprio',
      joiningdate: 'Member since 21/08/2021',
    ),
    Admin(
      color: 0xFF00E676,
      profilePic: 'assets/old_man.jpg',
      fullname: 'Clinton Imora',
      joiningdate: 'Member since 11/04/2020',
    ),
    Admin(
      color: 0xFF880E4F,
      profilePic: 'assets/wird_dude.jpg',
      fullname: 'Ronald Kelechi',
      joiningdate: 'Member since 31/08/2001',
    ),
    Admin(
      color: 0xFFF44336,
      profilePic: "assets/blackyounggirl.jpg",
      fullname: 'John Oseni',
      joiningdate: 'Member since 1/09/2011',
    ),
    Admin(
      color: 0xFF29B6F6,
      profilePic: "assets/old_man.jpg",
      fullname: 'Jimmy Donaldson',
      joiningdate: 'Member since 1/09/2021',
    ),
    Admin(
      color: 0xFF004D40,
      profilePic: "assets/young_man.jpg",
      fullname: 'Dustin Evan',
      joiningdate: 'Member since 1/09/2010',
    ),
    Admin(
      color: 0xFFD500F9,
      profilePic: "assets/blackyounggirl.jpg",
      fullname: 'Ivanda Alex',
      joiningdate: 'Member since 1/09/2002',
    ),
  ];

  ExampleApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SearchableList<Admin>(
                  initialList: admin,
                  builder: (dynamic admin) => AdminItem(admin: admin),
                  filter: _filterUserList,
                  emptyWidget: const EmptyView(),
                  inputDecoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    filled: true,
                    fillColor: Colors.grey[800],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

// Search function searches based only on name doesn't matter if it's first or
// last
  List<Admin> _filterUserList(search) {
    return admin
        .where(
          (element) =>
              element.fullname.toLowerCase().contains(search) ||
              element.fullname.contains(search),
        )
        .toList();
  }
}
