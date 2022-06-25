import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cardone1/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cardone1/loginscreen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cardone1/home1.dart';

class account extends StatefulWidget {
  const account({Key? key}) : super(key: key);

  @override
  _accountState createState() => _accountState();
}

class _accountState extends State<account> {
  User? user = FirebaseAuth.instance.currentUser;
  Usermodel loggedInUser = Usermodel();
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = Usermodel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginbutton=Material(
      elevation: 5,
      color:Colors.red,
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text("Your Account"),
        backgroundColor: Colors.red,
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Center(
          child: Container(
          alignment: Alignment.center,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                SizedBox(
                  height: 50,
                ),

                Text("Your Profile ",textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black,fontFamily: 'Poppins'),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 170,
                  height: 3,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                ),

                SizedBox(
                  height: 80,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Text("Name : ",textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22,fontWeight: FontWeight.w300,color: Colors.black,fontFamily: 'Poppins'),
                      ),
                      Text("${loggedInUser.name}",textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22,fontWeight: FontWeight.w300,color: Colors.black,fontFamily: 'Poppins'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Text("Number : ",textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22,fontWeight: FontWeight.w300,color: Colors.black,fontFamily: 'Poppins'),
                      ),
                      Text("${loggedInUser.number}",textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22,fontWeight: FontWeight.w300,color: Colors.black,fontFamily: 'Poppins'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Text("email : ",textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22,fontWeight: FontWeight.w300,color: Colors.black,fontFamily: 'Poppins'),
                      ),
                      Text("${loggedInUser.emailauth}",textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22,fontWeight: FontWeight.w300,color: Colors.black,fontFamily: 'Poppins'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 140,
                ),


                loginbutton,
              ],
            ),
          ),
        ),
      )
    );
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}