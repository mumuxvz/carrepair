import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfinalcar/home.dart';
import 'package:url_launcher/url_launcher.dart';

class information extends StatefulWidget {
  const information({Key? key}) : super(key: key);

  @override
  _informationState createState() => _informationState();
}

class _informationState extends State<information> {
  @override

  Widget build(BuildContext context) {
    final number1="+919924800702";
    return Scaffold(
      backgroundColor: Colors.white,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation:0,
        title: Text("Information",style: TextStyle(fontWeight: FontWeight.w400,fontFamily: 'Poppins',fontSize: 25,color: Colors.black),),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child:Flexible(
            child: Column(
              children: [
                Container(
                  width: 1200,
                  height: 125,
                  margin: const EdgeInsets.all(12.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.redAccent
                  ),
                  child: Column(
                    children:<Widget> [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("name : Rajubhai",style: TextStyle(fontSize: 15,fontFamily: 'Poppins',fontWeight: FontWeight.w300,color: Colors.black),),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("Address : sudama chowk,motavarachha surat ",style: TextStyle(fontSize: 15,fontFamily: 'Poppins',fontWeight: FontWeight.w300,color: Colors.black),),
                      ),
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: IconButton(
                              onPressed: () async{
                                // launch('tel://$number1');
                              },
                              icon: Icon(Icons.phone,color: Colors.black,),
                            ),
                          ),
                          Text(":  9925623450",style: TextStyle(fontSize: 15,fontFamily: 'Poppins',fontWeight: FontWeight.w300,color: Colors.black),),
                          SizedBox(width: 150,),
                          Icon(Icons.mail,color: Colors.black,),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 1200,
                  height: 110,
                  margin: const EdgeInsets.all(12.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.redAccent
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("name : Rajubhai",style: TextStyle(fontSize: 15,fontFamily: 'Poppins',fontWeight: FontWeight.w300,color: Colors.black),),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("Address : sudama chowk,motavarachha surat ",style: TextStyle(fontSize: 15,fontFamily: 'Poppins',fontWeight: FontWeight.w300,color: Colors.black),),
                      ),
                      Row(
                        children: [
                          Icon(Icons.phone,color: Colors.black,),
                          Text("  :  9925623450",style: TextStyle(fontSize: 15,fontFamily: 'Poppins',fontWeight: FontWeight.w300,color: Colors.black),),
                          SizedBox(width: 170,),
                          Icon(Icons.mail,color: Colors.black,),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 1200,
                  height: 110,
                  margin: const EdgeInsets.all(12.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.redAccent
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("name : Rajubhai",style: TextStyle(fontSize: 15,fontFamily: 'Poppins',fontWeight: FontWeight.w300,color: Colors.black),),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("Address : sudama chowk,motavarachha surat ",style: TextStyle(fontSize: 15,fontFamily: 'Poppins',fontWeight: FontWeight.w300,color: Colors.black),),
                      ),
                      Row(
                        children: [
                          Icon(Icons.phone,color: Colors.black,),
                          Text("  :  9925623450",style: TextStyle(fontSize: 15,fontFamily: 'Poppins',fontWeight: FontWeight.w300,color: Colors.black),),
                          SizedBox(width: 170,),
                          Icon(Icons.mail,color: Colors.black,),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 1200,
                  height: 110,
                  margin: const EdgeInsets.all(12.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.redAccent
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("name : Rajubhai",style: TextStyle(fontSize: 15,fontFamily: 'Poppins',fontWeight: FontWeight.w300,color: Colors.black),),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("Address : sudama chowk,motavarachha surat ",style: TextStyle(fontSize: 15,fontFamily: 'Poppins',fontWeight: FontWeight.w300,color: Colors.black),),
                      ),
                      Row(
                        children: [
                          Icon(Icons.phone,color: Colors.black,),
                          Text("  :  9925623450",style: TextStyle(fontSize: 15,fontFamily: 'Poppins',fontWeight: FontWeight.w300,color: Colors.black),),
                          SizedBox(width: 170,),
                          Icon(Icons.mail,color: Colors.black,),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 1200,
                  height: 110,
                  margin: const EdgeInsets.all(12.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.redAccent
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("name : Rajubhai",style: TextStyle(fontSize: 15,fontFamily: 'Poppins',fontWeight: FontWeight.w300,color: Colors.black),),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("Address : sudama chowk,motavarachha surat ",style: TextStyle(fontSize: 15,fontFamily: 'Poppins',fontWeight: FontWeight.w300,color: Colors.black),),
                      ),
                      Row(
                        children: [
                          Icon(Icons.phone,color: Colors.black,),
                          Text("  :  9925623450",style: TextStyle(fontSize: 15,fontFamily: 'Poppins',fontWeight: FontWeight.w300,color: Colors.black),),
                          SizedBox(width: 170,),
                          Icon(Icons.mail,color: Colors.black,),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 1200,
                  height: 110,
                  margin: const EdgeInsets.all(12.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.redAccent
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("name : Rajubhai",style: TextStyle(fontSize: 15,fontFamily: 'Poppins',fontWeight: FontWeight.w300,color: Colors.black),),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("Address : sudama chowk,motavarachha surat ",style: TextStyle(fontSize: 15,fontFamily: 'Poppins',fontWeight: FontWeight.w300,color: Colors.black),),
                      ),
                      Row(
                        children: [
                          Icon(Icons.phone,color: Colors.black,),
                          Text("  :  9925623450",style: TextStyle(fontSize: 15,fontFamily: 'Poppins',fontWeight: FontWeight.w300,color: Colors.black),),
                          SizedBox(width: 170,),
                          Icon(Icons.mail,color: Colors.black,),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
