import 'package:flutter/material.dart';
import 'package:mycarrepair/home.dart';
import 'package:mycarrepair/sos.dart';
import 'package:mycarrepair/information.dart';
import 'package:mycarrepair/account.dart';


class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int _current=0;

  final tabs=[
    myhome(),
    sos(),
    information(),
    account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[900],
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   title: Text("welcome my app"),centerTitle: true,),
      body: tabs[_current],

      bottomNavigationBar: BottomNavigationBar(

        // backgroundColor: Colors.black,
        currentIndex: _current,
        type: BottomNavigationBarType.fixed,
        // fixedColor: Colors.white,
        iconSize: 30,
        selectedFontSize: 15,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.black,),
            label:'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emergency_outlined,color: Colors.black,),
            label:'emergency',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_library,color: Colors.black,),
            label:'info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,color: Colors.black),
            label:'Account',
          ),
        ],
        onTap: (index){
          setState(() {
            _current=index;
          });
        },
      ),
    );
  }
}
