import 'package:flutter/material.dart';
import 'package:cardone1/loginscreen.dart';
import 'package:cardone1/signup.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.indigoAccent],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Welcome to",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        color: Colors.black,
                      ),
                    ),

                    Text(
                      "Cardone",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        fontFamily: 'Poppins',
                        color: Colors.black,
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Cars giving you trouble ?",
                      textAlign: TextAlign.center,

                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      "This is the way to go.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Poppins',
                      ),
                    )
                  ],
                ),

                CircleAvatar(
                  radius: 170,
                  child: Image.asset(
                    'assets/hello.png'
                  ),
                ),

                Column(
                  children: <Widget>[
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      },
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),

                    SizedBox(height: 20,),

                    MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen()));
                      },
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}