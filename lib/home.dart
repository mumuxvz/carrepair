import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfinalcar/home1.dart';
import 'package:google_sign_in/google_sign_in.dart';


class myhome extends StatefulWidget {
  const myhome({Key? key}) : super(key: key);

  @override
  _myhomeState createState() => _myhomeState();
}

class _myhomeState extends State<myhome> {
  @override
  Widget build(BuildContext context) {
    final loginbutton=Material(
      elevation: 5,
      color:Color(0xffec615c),
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        // color: Colors.cyanAccent,
        onPressed: () async{
          await FirebaseAuth.instance.signOut();
          await GoogleSignIn().signOut();
          setState(() {
            Navigator.push(context,MaterialPageRoute(builder: (context)=> HomePage()));
          });
        },
        child: Text("Log out",textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,fontFamily: 'Poppins'),
        ),
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
      ),

    );
    return Scaffold(
        extendBodyBehindAppBar: true,
        // backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation:0,
          title: Text("Home"),
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.blue],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child: Center(
            child: loginbutton,
          ),

        )
    );
  }
}
