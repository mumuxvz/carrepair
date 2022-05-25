import 'package:carrepair/homescreen.dart';
import 'package:carrepair/signupscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';


class loginscreen extends StatefulWidget {
  const loginscreen({Key? key}) : super(key: key);

  @override
  _loginscreenState createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {

  final _formkey=GlobalKey<FormState>();
  final  TextEditingController emailcontroller= new TextEditingController();
  final  TextEditingController passwordcontroller= new TextEditingController();
  final _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {

    final emailField = TextFormField(
      autofocus: false,
      controller: emailcontroller,
      style: TextStyle(color: Colors.white,fontSize: 30),
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
        emailcontroller.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail,color: Colors.white,),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Email',
          fillColor: Colors.grey.shade700,
        filled: true,
        hintStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontSize: 30,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        )
      ),
    );
    final passwordField = TextFormField(
      autofocus: false,
      style: TextStyle(color: Colors.white,fontSize: 30),
      controller: passwordcontroller,
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
        passwordcontroller.text=value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          fillColor: Colors.grey.shade700,
          filled: true,
          prefixIcon: Icon(Icons.lock,color: Colors.white,),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: 'Password',
          hintStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 30,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )
      ),
    );

    final loginbutton=Material(
      elevation: 5,
      color: Colors.cyanAccent,
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        // color: Colors.cyanAccent,
        onPressed: (){
          signin(emailcontroller.text, passwordcontroller.text);
          },
        child: Text("Login",textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
        ),
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
      ),

    );

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body:Center(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.grey[900],
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
                              Text("Login",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.cyanAccent),),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Please sign in to continue",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.cyanAccent),)
                            ],
                          ),
                        ),
                      ),
                      emailField,
                      SizedBox(height: 35,),
                      passwordField,
                      SizedBox(height: 45,),
                      loginbutton,
                      SizedBox(height: 45,),
                      Row(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children:<Widget> [
                          Text("Don't have an account ?",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 13,color: Colors.white),),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=> signup()));
                            },
                            child: Text(" SignUp",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: Colors.cyanAccent),),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),

              ),
            ),
          ),
      ),
    );
  }
  void signin(String email,String password) async
  {
    if(_formkey.currentState!.validate())
    {
      await _auth.signInWithEmailAndPassword(email: email, password: password)
          .then((uid) =>{
            Fluttertoast.showToast(msg: "login Succesful"),
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>homepage()))
          

      }).catchError((e)
          {
            Fluttertoast.showToast(msg: e!.message);
          });
    }
  }
}

