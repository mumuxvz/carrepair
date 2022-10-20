import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:get/get.dart';


class resetpass extends StatefulWidget {
  const resetpass({Key? key}) : super(key: key);

  @override
  _resetpassState createState() => _resetpassState();
}

class _resetpassState extends State<resetpass> {
  final _formKey = GlobalKey<FormState>();
  String _email='';
  final TextEditingController emailController = new TextEditingController();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Enter your Email',style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'Poppins'),),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Enter the email associated with your account and we will send an email with instruction to reset your password',style: TextStyle(color: Colors.black,fontSize: 15,fontFamily: 'Poppins'),),
                    SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                  autofocus: false,
                  controller: emailController,
                  style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'Poppins'),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value)
                    {
                      setState(() {
                        _email=value;
                      });
                    },
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
                  textInputAction: TextInputAction.done,
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
                        fontSize: 20,
                        fontFamily: 'Poppins',
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                ),
                    SizedBox(
                      height: 40,
                    ),
                Material(
                  elevation: 5,
                  color:Colors.red,
                  borderRadius: BorderRadius.circular(30),
                  child: MaterialButton(
                    // color: Colors.cyanAccent,
                    onPressed: (){
                      try {
                        _auth.sendPasswordResetEmail(
                            email: emailController.text.trim());
                      }
                      on FirebaseAuthException catch(e)
                      {
                        print(e);
                        showDialog(context: context, builder: (context)
                        {
                          return AlertDialog(
                            content: Text(e.message.toString()),
                          );
                        });
                      }
                      Navigator.of(context).pop();
                    },
                    child: Text("Send request",textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,fontFamily: 'Poppins'),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    minWidth: MediaQuery.of(context).size.width,
                  ),

                )
                  ],
                ),

              ),
            ),
          ),
        ),
      ),
    );
  }
}
