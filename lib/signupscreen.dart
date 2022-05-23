import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  final _formkey=GlobalKey<FormState>();
  final firstname=new TextEditingController();
  final secondname=new TextEditingController();
  final email=new TextEditingController();
  final password=new TextEditingController();
  final confpassword=new TextEditingController();



  @override
  Widget build(BuildContext context) {

    final firstField = TextFormField(
      autofocus: false,
      controller: firstname,
      style: TextStyle(color: Colors.white,fontSize: 20),
      keyboardType: TextInputType.name,
      //validator: ,
      onSaved: (value){
        firstname.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person,color: Colors.white,),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: 'Name',
          fillColor: Colors.grey.shade700,
          filled: true,
          hintStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 20,
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
      controller: email,
      style: TextStyle(color: Colors.white,fontSize: 20),
      keyboardType: TextInputType.name,
      //validator: ,
      onSaved: (value){
        email.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.email,color: Colors.white,),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: 'Email',
          fillColor: Colors.grey.shade700,
          filled: true,
          hintStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 20,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )
      ),
    );
    final passwordfield = TextFormField(
      autofocus: false,
      controller: password,
      style: TextStyle(color: Colors.white,fontSize: 20),
      // keyboardType: TextInputType.,
      //validator: ,
      obscureText: true,
      onSaved: (value){
        password.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock,color: Colors.white,),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: 'Password',
          fillColor: Colors.grey.shade700,
          filled: true,
          hintStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 20,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )
      ),
    );
    final confpasswordField = TextFormField(
      autofocus: false,
      controller: confpassword,
      style: TextStyle(color: Colors.white,fontSize: 20),
      keyboardType: TextInputType.name,
      //validator: ,
      obscureText: true,
      onSaved: (value){
        confpassword.text=value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock,color: Colors.white,),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: 'Confirm Password',
          fillColor: Colors.grey.shade700,
          filled: true,
          hintStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 20,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )
      ),
    );

    final signupbutton=Material(
      elevation: 5,
      color: Colors.cyanAccent,
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        // color: Colors.cyanAccent,
        onPressed: (){},
        child: Text("SignUp",textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
        ),
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
      ),

    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
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
                            Text("SignUp",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.cyanAccent),),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Please fill the input blow here",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.cyanAccent),),
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
    );
  }
}
