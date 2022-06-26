import 'package:cardone1/mmaps_util.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cardone1/order_traking_page.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:auto_reload/auto_reload.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late LatLng yourlocation;
  late LatLng garage;
  var a1;
  late int k;
  late double min;
  int count=0;
  LatLng caldist() {
    List a=[
      [21.17104619888153, 72.82967768865495],
      [21.218215, 72.777346],
      [21.209467, 72.79515],
      [21.1866595, 72.8124231],
      [21.1652706, 72.776807],
      [21.1876166, 72.8163833],
      [21.2349468, 72.8605523],
      [21.1355655, 72.7745053],
    ];
    var min=1000000000000.0000;
    double dist;
    List  b=[];
    LatLng neargarage;
    LatLng c=LatLng(yourlocation.latitude, yourlocation.longitude);
    var m=0;
    var n=1;
    var j=1;
    for (var i = 0; i < 8; i++) {
      dist= Geolocator.distanceBetween(
          c.latitude,c.longitude, a[i][m],
          a[i][n]);
      dist = dist / 1000;
      b.add(dist);
      if(min>dist)
        {
          min=dist;
        }
      print(dist);
    }
    print('minimum = ${min}');
    for(var i=0;i<8;i++)
      {
        if(b[i]==min)
          {
            j=i;
            break;
          }
      }
    print(j);
    neargarage=LatLng(a[j][0],a[j][1]);
    return neargarage;
    // print('garge near you location : ${neargarage}');

  }
  int position() {
    List a=[
      [21.17104619888153, 72.82967768865495],
      [21.218215, 72.777346],
      [21.209467, 72.79515],
      [21.1866595, 72.8124231],
      [21.1652706, 72.776807],
      [21.1876166, 72.8163833],
      [21.2349468, 72.8605523],
      [21.1355655, 72.7745053],
    ];
    var min=1000000000000.0000;
    double dist;
    List  b=[];
    LatLng neargarage;
    getUserCurrentLoaction().then((value) async{
      print(value.latitude.toString()+"  "+value.longitude.toString());
      yourlocation=LatLng(value.latitude, value.longitude);
      // print(yourlocation);
    });
    LatLng c=LatLng(yourlocation.latitude, yourlocation.longitude);
    var m=0;
    var n=1;
    var j=1;
    for (var i = 0; i < 8; i++) {
      dist= Geolocator.distanceBetween(
          c.latitude,c.longitude, a[i][m],
          a[i][n]);
      dist = dist / 1000;
      b.add(dist);
      if(min>dist)
      {
        min=dist;
      }
      print(dist);
    }
    print('minimum = ${min}');
    for(var i=0;i<8;i++)
    {
      if(b[i]==min)
      {
        j=i;
        break;
      }
    }
    print(j);
   return j;
    // print('garge near you location : ${neargarage}');

  }

  Future<Position> getUserCurrentLoaction() async{
    await Geolocator.requestPermission().then((value){


    }).onError((error, stackTrace) {
      print("error"+error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  double caldist1() {
    List a = [
      [21.17104619888153, 72.82967768865495],
      [21.218215, 72.777346],
      [21.209467, 72.79515],
      [21.1866595, 72.8124231],
      [21.1652706, 72.776807],
      [21.1876166, 72.8163833],
      [21.2349468, 72.8605523],
      [21.1355655, 72.7745053],
    ];
    var min = 1000000000000.0000;
    double dist;
    List b = [];
    LatLng neargarage;
    LatLng c = LatLng(yourlocation.latitude, yourlocation.longitude);
    var m = 0;
    var n = 1;
    var j = 1;
    for (var i = 0; i < 8; i++) {
      dist = Geolocator.distanceBetween(
          c.latitude, c.longitude, a[i][m],
          a[i][n]);
      dist = dist / 1000;
      b.add(dist);
      if (min > dist) {
        min = dist;
      }
      print(dist);
    }
    print(min);
    return min;
  }
  void sending_SMS(String msg, List<String> list_receipents) async {
    String send_result = await sendSMS(message: msg, recipients: list_receipents)
        .catchError((err) {
          print('hello error accourd');
      print(err);
    });
    print(send_result);
  }

  void initState(){
    yourlocation=LatLng(0, 0);
    getUserCurrentLoaction().then((value) async{
      print(value.latitude.toString()+"  "+value.longitude.toString());
      yourlocation=LatLng(value.latitude, value.longitude);
      // print(yourlocation);
    });
    count=0;
    garage=LatLng(0, 0);
    min=0.0;


    // super.initState();
  }


  @override

  Widget build(BuildContext context) {
    List garagename=[
      'Vrundavan',
      'Jignesh',
      'patel',
      'varudi',
      'mahavir',
      'maruti',
      'raghodi',
      'carcare',
    ];
    List ownername=[
      'Rajubhai',
      'Jigneshbhai',
      'Ramesgbhai',
      'Arvindbhai',
      'Maheshbhai',
      'Rahulbhai',
      'Rmanbhai',
      'Kanubhai',
    ];
    List number=[
      '9898923665',
      '9913003346',
      '9979704006',
      '9924001659',
      '9824283165',
      '9924567890',
      '9934568789',
      '9934120099',
    ];
    int a=position();


    return Scaffold(
          appBar: AppBar(
            title: Text('Emergency',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'Poppins',fontSize: 20 ),),
            centerTitle: true,
            backgroundColor: Colors.red,
            elevation: 0,
            automaticallyImplyLeading: false,
          ),
      body:Container(
        // decoration: const BoxDecoration(
        //
        //   gradient: LinearGradient(
        //
        //     colors: [Colors.white, Colors.redAccent],
        //     begin: Alignment.bottomLeft,
        //     end: Alignment.topRight,
        //   ),
        // ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Container(
                child: Text(' If Your Car is not Working ?',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'Poppins',fontSize: 20 ),),
              ),
              SizedBox(
                height: 20,
              ),

              Container(
                height: 3,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
              ),

              SizedBox(
                height: 10,
              ),
              Container(
                child: Text('Emergency help',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'Poppins',fontSize: 25 ),),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Text('needed ?',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'Poppins',fontSize: 25 ),),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Text('Just press the button 3 times',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w200,fontFamily: 'Poppins',fontSize: 15 ),),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 150,
                width: 150,
                child: MaterialButton(
                  elevation: 10,
                  onPressed: () {

                    count=count+1;
                    getUserCurrentLoaction().then((value) async{
                      print(value.latitude.toString()+"  "+value.longitude.toString());
                      yourlocation=LatLng(value.latitude, value.longitude);
                      // print(yourlocation);
                    });
                    print("https://www.google.com/maps/search/?api=1&query=$yourlocation.latitude,$yourlocation.longitude");

                    // MapUtils.openMap(garage.latitude,garage.longitude);

                    if(count >2) {
                      sending_SMS(
                          "https://www.google.com/maps/search/?api=1&query=${yourlocation
                              .latitude},${yourlocation
                              .longitude} mobile no = 9924800702", [number[a]]);
                    }
                    a1=0;
                    setState(() {
                      double dist=caldist1();
                      min=double.parse((dist).toStringAsFixed(2));
                    });
                    // MapUtils.openMap(garage.latitude,garage.longitude);

                  //   Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => sos()),
                  //   );
                  },
                  color: Colors.red,
                  textColor: Colors.white,
                  child: Center(
                    child:Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'S',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'Poppins',fontSize: 50 ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'O',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'Poppins',fontSize: 50 ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'S',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'Poppins',fontSize: 50 ),
                        ),
                      ],
                    ),
                  ),
                  padding: EdgeInsets.all(16),
                  shape: CircleBorder(),
                ),
              ),

              // SizedBox(
              //   height: 20,
              // ),
              //   Container(
              //     child: Text('near garage loaction ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'Poppins',fontSize: 20 ),
              //     ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Container(
              //   child: Text('${garage.latitude},${garage.longitude}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'Poppins',fontSize: 20 ),
              //   ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // Container(
              //   child: Text('your loaction ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'Poppins',fontSize: 20 ),
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Container(
              //   child: Text('${yourlocation.latitude},${yourlocation.longitude}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'Poppins',fontSize: 20 ),
              //   ),
              // ),

              SizedBox(
                height: 25,
              ),
              Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("nearest garage is ${min} Km ",
                         style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'Poppins',fontSize: 20
                        )
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Owner information',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'Poppins',fontSize: 30)),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 3,
                      width: 300,
                      color: Colors.red,

                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Garage Name : ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'Poppins',fontSize: 20)),
                        Text(garagename[a],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'Poppins',fontSize: 20)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Name : ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'Poppins',fontSize: 20)),
                        Text(ownername[a],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'Poppins',fontSize: 20)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Number : ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'Poppins',fontSize: 20)),
                        Text(number[a].toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'Poppins',fontSize: 20)),
                      ],
                    ),
                     Container(
                       width: 200,
                       child:  MaterialButton(
                         elevation: 10,
                         onPressed: () {
                           if(count>2) {
                             garage = caldist();
                             print(
                                 "https://www.google.com/maps/search/?api=1&query=${garage
                                     .latitude},${garage.longitude}");
                             MapUtils.openMap(
                                 garage.latitude, garage.longitude);
                           }
                         },
                         color: Colors.red,
                         textColor: Colors.white,
                         child: Text("garage location",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'Poppins',fontSize: 20)),
                       ),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(40),
                       ),
                     ),
                  ],
                )
              )

            ],
          ),
        ),
      ),
    );
  }
}

