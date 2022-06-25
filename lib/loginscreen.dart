import 'dart:async';

import 'package:cardone1/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cardone1/homescreen.dart';
import 'package:cardone1/signup.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  // firebase
  final _auth = FirebaseAuth.instance;
  final storage=new FlutterSecureStorage();
  // string for displaying the error Message
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      style: TextStyle(color: Colors.black,fontSize: 25,fontFamily: 'Poppins'),
      keyboardType: TextInputType.emailAddress,
      validator:(value){
        if(value!.isEmpty)
        {
          return ("Please Enter your Email");
        }
        if(!RegExp("^[a-zA-Z0-9+_,-]+@[a-zA-Z0-9,-]+.[a-z]").hasMatch(value))
        {
          return("please Enter a valid Email");
        }
        return null;

      },
      onSaved: (value){
        emailController.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail,color: Colors.black,),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: 'Email',
          fillColor: Colors.white,
          filled: true,
          hintStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 25,
            fontFamily: 'Poppins',
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )
      ),
    );

    //password field
    final passwordField = TextFormField(
      autofocus: false,
      style: TextStyle(color: Colors.black,fontSize: 25,fontFamily: 'Poppins'),
      controller: passwordController,
      obscureText: true,
      validator:(value) {
        RegExp regex=new RegExp(r'^.{6,}$');
        if(value!.isEmpty)
        {
          return("Plese Enter your Password");
        }
        if(!regex.hasMatch(value))
        {
          return("please enter valid Password (min 6 character");
        }
      },
      onSaved: (value){
        passwordController.text=value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Icon(Icons.lock,color: Colors.black,),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: 'Password',
          hintStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 25,
            fontFamily: 'Poppins',
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )
      ),
    );
    final logingoogle=Material(
      elevation: 5,
      color:Colors.white,
      borderRadius: BorderRadius.circular(25),
      child: MaterialButton(
        // color: Colors.cyanAccent,
          onPressed: () async{
            await signInWithGoogle1();
            setState(() {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => homepage()));
            });
          },
          child: Container(
            alignment: Alignment.center,
            height: 50,
            // width: (MediaQuery.of(context).size.width)/3,
            width:105,
            child: Row(

                children: <Widget>[
                  Image.asset(
                    'assets/google.png',
                  ),
                  // SizedBox(width: 5.0,),
                  Text("Google",style:TextStyle(fontFamily: 'Poppins',fontSize: 15,fontWeight: FontWeight.w300,color: Colors.black)),
                ]
            ),
          )

      ),
    );

    final loginfacebook=Material(
      elevation: 5,
      color:Colors.white,
      borderRadius: BorderRadius.circular(25),
      child: MaterialButton(
        // color: Colors.cyanAccent,
          onPressed: (){

          },
          child: Container(
            alignment: Alignment.center,
            height: 50,
            width: 125,
            child: Row(
                children: <Widget>[
                  Image.asset(
                    'assets/facebook.png',
                  ),
                  // SizedBox(width: 2.0,),
                  Text("Facebook",style:TextStyle(fontFamily: 'Poppins',fontSize: 15,fontWeight: FontWeight.w300,color: Colors.black)),
                ]
            ),
          )

      ),
    );

    final loginbutton=Material(
      elevation: 5,
      color:Colors.red,
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        // color: Colors.cyanAccent,
        onPressed: (){
          signIn(emailController.text, passwordController.text);
        },
        child: Text("Login",textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,fontFamily: 'Poppins'),
        ),
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
      ),

    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    SizedBox(
                      height: 150,
                      child: Center(
                        child: Column(
                          children: [
                            Text("Login",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.black,fontFamily: 'Poppins'),),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Please sign in to continue",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.black,fontFamily: 'Poppins'),)
                          ],
                        ),
                      ),
                    ),
                    emailField,
                    SizedBox(height: 35,),
                    passwordField,
                    SizedBox(height: 35,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        logingoogle,
                        SizedBox(width: 5,),
                        loginfacebook,
                      ],
                    ),
                    SizedBox(height: 45,),
                    loginbutton,
                    SizedBox(height: 45,),
                    Row(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children:<Widget> [
                          Text("Don't have an account ?",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15,color: Colors.black,fontFamily: 'Poppins'),),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=> RegistrationScreen()));
                            },
                            child: Text(" SignUp",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.red,fontFamily: 'Poppins'),),
                          ),
                        ])
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // login function
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
             await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
          Fluttertoast.showToast(msg: "Login Successful"),
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => homepage())),
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }
  Future<UserCredential> signInWithGoogle1() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // userEmail = googleUser.email;

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

