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
            style: TextStyle(
              color: Colors.white,
              fontSize: 20),
          ),
        ],
      ),
    );
  }
}

class Admin {
  AssetImage profilePic;
  String fullname;
  String joiningdate;

  Admin({
    required this.profilePic,
    required this.fullname,
    required this.joiningdate,
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
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          // First Column
          Column(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('picture: ${admin.profilePic}')
                        ),
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
                  left: 60,
                  right: 10,),
                child: Column(
                  children: [
                    Text(admin.fullname,
                    style: const TextStyle(color: Colors.white,
                    fontSize: 18,),
                    ),
                  ],
                ),
              ),
              Container(
                width: 150,
                margin: const EdgeInsets.only(
                  top: 10,
                  left: 60,
                  right: 10,),
                child: Column(
                  children: [
                    Text(admin.joiningdate,style: const TextStyle(color: Colors.white,
                    fontSize: 12),),
                  ],
                ),
              ),
            ],
          ),

          // Third Column
          Column(
            children:[
             Container(
               margin: const EdgeInsets.only(left:100),
               child: const Icon(Icons.more_horiz,color: Colors.white,size: 50,),
             ),
            ],
          ),
          
        ],
      ),
    );
  }
}

class ExampleApp extends StatelessWidget {
  List graphic = ["black_young_man.jpg", "hot_girl.jpg"];
  //  Please leave it it kept on giving error's ronald kelechi
  final List<Admin> admin = [
    Admin(
      profilePic: const AssetImage('black_young_man.jpg'),
      fullname: 'Ivan Decaprio',
      joiningdate: 'Member since 21/08/2021',
    ),
    Admin(
      profilePic: const AssetImage('assets/old_man.jpg'),
      fullname: 'Clinton Imora',
      joiningdate: 'Member since 11/04/2020',
    ),
    Admin(
      profilePic: const AssetImage('assets/blackyounggirl.jpg'),
      fullname: 'Ronald Kelechi',
      joiningdate: 'Member since 31/08/2001',
    ),
    Admin(
      profilePic: const AssetImage("assets/blackyounggirl.jpg"),
      fullname: 'John Oseni',
      joiningdate: 'Member since 1/09/2011',
    ),
  ];

  ExampleApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10,right: 10),
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
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Colors.grey[600],
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide:
                            BorderSide(color: Colors.white, width: 1.5)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 0.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
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
