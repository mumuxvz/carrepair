import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mycarrepair/usermodel.dart';
import 'package:mycarrepair/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  String? errorMessage;



  final _formkey=GlobalKey<FormState>();
  final firstname=new TextEditingController();
  final secondname=new TextEditingController();
  final emailauth=new TextEditingController();
  final password=new TextEditingController();
  final confpassword=new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //first name field
    final firstField = TextFormField(
      autofocus: false,
      controller: firstname,
      style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'Poppins'),
      keyboardType: TextInputType.name,
      validator:(value) {
        RegExp regex=new RegExp(r'^.{6,}$');
        if(value!.isEmpty)
        {
          return("Name cannot be empty");
        }
        if(!regex.hasMatch(value))
        {
          return("please enter valid Password (min 6 character");
        }
        return null;
      },
      onSaved: (value){
        firstname.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person,color: Colors.black,),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: 'Name',
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
    );
    // final secondField = TextFormField(
    //   autofocus: false,
    //   controller: secondname,
    //   style: TextStyle(color: Colors.white,fontSize: 20),
    //   keyboardType: TextInputType.emailAddress,
    //   //validator: ,
    //   onSaved: (value){
    //     email.text=value!;
    //   },
    //   textInputAction: TextInputAction.next,
    //   decoration: InputDecoration(
    //       prefixIcon: Icon(Icons.person,color: Colors.white,),
    //       contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
    //       hintText: 'Second Name',
    //       fillColor: Colors.grey.shade700,
    //       filled: true,
    //       hintStyle: TextStyle(
    //         color: Colors.white,
    //         fontWeight: FontWeight.w400,
    //         fontStyle: FontStyle.normal,
    //         fontSize: 20,
    //       ),
    //       border: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(20),
    //       )
    //   ),
    // );
    final emailField = TextFormField(
        autofocus: false,
        controller: emailauth,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'Poppins'),
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailauth.text = value!;
        },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.email,color: Colors.black,),
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
    );
    final passwordfield = TextFormField(
      autofocus: false,
      controller: password,
      style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'Poppins'),
      // keyboardType: TextInputType.,
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
      obscureText: true,
      onSaved: (value){
        password.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock,color: Colors.black,),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: 'Password',
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
    );
    final confpasswordField = TextFormField(
      autofocus: false,
      controller: confpassword,
      style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'Poppins'),
      keyboardType: TextInputType.name,
      validator: (value)
      {
        if(confpassword.text.length>6 && password.text!=value)
        {
          return "password don't match";
        }
        return null;
      },
      obscureText: true,
      onSaved: (value){
        confpassword.text=value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock,color: Colors.black,),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: 'Confirm Password',
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
    );

    final signupbutton=Material(
      elevation: 5,
        color:Color(0xffec615c),
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        // color: Colors.cyanAccent,
        onPressed: (){
          signUp(emailauth.text,password.text);
        },
        child: Text("SignUp",textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.white,fontFamily: 'Poppins'),
        ),
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
      ),

    );

    return Scaffold(

      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body:Container(
        child:Center(
          child: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(26.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 150,
                        child: Center(
                          child: Column(
                            children: [
                              Text("SignUp",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.black,fontFamily: 'Poppins'),),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Please fill the input blow here",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.black,fontFamily: 'Poppins'),),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      firstField,
                      SizedBox(height: 30,),
                      // secondField,
                      // SizedBox(height: 30,),
                      emailField,
                      SizedBox(height: 30,),
                      passwordfield,
                      SizedBox(height: 30,),
                      confpasswordField,
                      SizedBox(height: 40,),
                      signupbutton,
                      // SizedBox(height: 40,),
                    ],
                  ),
                ),

              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
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
  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    Usermodel userModel = Usermodel();

    // writing all the values
    userModel.emailauth = user!.email;
    userModel.uid = user.uid;
    userModel.name = firstname.text;


    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => homepage()),
            (route) => false);
  }

}