import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cardone1/home.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class information extends StatefulWidget {
  const information({Key? key}) : super(key: key);

  @override
  _informationState createState() => _informationState();
}

class _informationState extends State<information> {
  @override
  Widget build(BuildContext context) {
    final number1 = "+919924800702";
    return Scaffold(
      backgroundColor: Colors.white,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            // gradient: LinearGradient(
            //     begin: Alignment.topCenter,
            //     end: Alignment.bottomCenter,
            //     colors: [
            //       Colors.yellow,
            //       Colors.red,
            //     ]),
            color: Colors.red
          ),
        ),
        elevation: 0,
        title: Column(
          children: [
            Text(
              "Information of Garages",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  color: Colors.white),
            ),
            // Container(
            //   width: 300,
            //   height: 3,
            //   margin: const EdgeInsets.all(4.0),
            //   padding: const EdgeInsets.all(2.0),
            //   color: Colors.yellow,
            // )
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //     colors: [
          //       Colors.red,
          //       Colors.yellow,
          //       Colors.red,
          //     ]),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Flexible(
            child: Column(
              children: [
                Container(
                  width: 1200,
                  height: 480,
                  margin: const EdgeInsets.all(12.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 3),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    // gradient: LinearGradient(
                    //   begin: Alignment.topCenter,
                    //   end: Alignment.bottomCenter,
                    //   colors: [
                    //     Color(0xffff615c),
                    //     Colors.white,
                    //   ],
                    // ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Vrundavan",
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 3,
                          margin: const EdgeInsets.all(4.0),
                          padding: const EdgeInsets.all(2.0),
                          color: Colors.red,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Owner : Rajubhai",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Address : 150 Feet Ring Road Opp Balaji Hall, Opp Sanidya Bunglows, Aditya Park, Chandreshnagar, Rajkot, Gujarat 360004",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () async {
                                  // launch('tel://$number1');
                                },
                                icon: Icon(
                                  Icons.phone,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                ":  9898923656",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () async {
                                  // launch('tel://$number1');
                                },
                                icon: Icon(
                                  Icons.mail,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                ":  raju2109@gmail.com",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        // ClipRRect(
                        //   borderRadius: BorderRadius.circular(10),
                        //   child: Image.asset(
                        //     'assets/garage1.jpg',
                        //   ),
                        // ),
                        // SizedBox(height: 10,),
                        // ClipRRect(
                        //   borderRadius: BorderRadius.circular(10),
                        //   child: Image.asset(
                        //     'assets/garage1_!.jpg',
                        //   ),
                        // ),
                        CarouselSlider(
                          options: CarouselOptions(
                            enableInfiniteScroll: false,
                            enlargeCenterPage: true,
                            autoPlay: true,
                          ),
                          items: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 19, 0, 19),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.red, width: 3),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Image.asset(
                                'assets/garage1.jpg',
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 19, 0, 19),
                                decoration: BoxDecoration(
                                  border:
                                  Border.all(color: Colors.red, width: 3),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Image.asset('assets/garage1_!.jpg'))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 1200,
                  height: 480,
                  margin: const EdgeInsets.all(12.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.red, width: 3),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Jignesh",
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          width: 110,
                          height: 3,
                          margin: const EdgeInsets.all(4.0),
                          padding: const EdgeInsets.all(2.0),
                          color: Colors.red,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Owner : Jigneshbhai",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Address : 150 Feet Ring Rd, Mavdi Plot Side, Beside Moon Light Marble, Poonam Society, Uday Nagar - 1, Rajkot, Gujarat 360004",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () async {
                                  // launch('tel://$number1');
                                },
                                icon: Icon(
                                  Icons.phone,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                ":  9913003346",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(53, 0, 0, 0),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () async {
                                  // launch('tel://$number1');
                                },
                                icon: Icon(
                                  Icons.mail,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                ":  jigneshauto@gmail.com",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        CarouselSlider(
                          options: CarouselOptions(
                            enableInfiniteScroll: false,
                            enlargeCenterPage: true,
                            autoPlay: true,
                          ),
                          items: [
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 19, 0, 19),
                                decoration: BoxDecoration(
                                  border:
                                  Border.all(color: Colors.red, width: 3),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Image.asset('assets/garage2.jpg')),
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 19, 0, 19),
                                decoration: BoxDecoration(
                                  border:
                                  Border.all(color: Colors.red, width: 3),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Image.asset('assets/garage2_2.jpg'))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 1200,
                  height: 480,
                  margin: const EdgeInsets.all(12.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 3),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Patel",
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          width: 90,
                          height: 3,
                          margin: const EdgeInsets.all(4.0),
                          padding: const EdgeInsets.all(2.0),
                          color: Colors.red,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Owner : Rameshbhai",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Address : 4, Prajapati Society, Plot, 40 Feet Rd, Dharam Nagar, Mavdi, Rajkot, Gujarat 360004",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () async {
                                  // launch('tel://$number1');
                                },
                                icon: Icon(
                                  Icons.phone,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                ":  9979704006",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(45, 0, 0, 0),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () async {
                                  // launch('tel://$number1');
                                },
                                icon: Icon(
                                  Icons.mail,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                ":  rameshmotor@gmail.com",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        CarouselSlider(
                          options: CarouselOptions(
                            enableInfiniteScroll: false,
                            enlargeCenterPage: true,
                            autoPlay: true,
                          ),
                          items: [
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 19, 0, 19),
                                decoration: BoxDecoration(
                                  border:
                                  Border.all(color: Colors.red, width: 3),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Image.asset('assets/garage3.jpg')),
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 19, 0, 19),
                                decoration: BoxDecoration(
                                  border:
                                  Border.all(color: Colors.red, width: 3),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Image.asset('assets/garage3_2.jpg'))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 1200,
                  height: 480,
                  margin: const EdgeInsets.all(12.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 3),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Varudi",
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          width: 90,
                          height: 3,
                          margin: const EdgeInsets.all(4.0),
                          padding: const EdgeInsets.all(2.0),
                          color: Colors.red,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Owner : Arvindbhai",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Address : 150Ft Ring Road,40Ft Road,Dharam Nagar Main Road,, Rajkot, Gujarat 360004",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () async {
                                  // launch('tel://$number1');
                                },
                                icon: Icon(
                                  Icons.phone,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                ":  9924001659",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(55, 0, 0, 0),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () async {
                                  // launch('tel://$number1');
                                },
                                icon: Icon(
                                  Icons.mail,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                ":  arvindcar@gmail.com",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        CarouselSlider(
                          options: CarouselOptions(
                            enableInfiniteScroll: false,
                            enlargeCenterPage: true,
                            autoPlay: true,
                          ),
                          items: [
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 19, 0, 19),
                                decoration: BoxDecoration(
                                  border:
                                  Border.all(color: Colors.red, width: 3),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Image.asset('assets/garage4.jpg')),
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 19, 0, 19),
                                decoration: BoxDecoration(
                                  border:
                                  Border.all(color: Colors.red, width: 3),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Image.asset('assets/garage4_2.jpg'))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 1200,
                  height: 480,
                  margin: const EdgeInsets.all(12.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 3),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Mahavir",
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          width: 110,
                          height: 3,
                          margin: const EdgeInsets.all(4.0),
                          padding: const EdgeInsets.all(2.0),
                          color: Colors.red,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Owner : Maheshbhai",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Address : 7QJ3+62J, Parijat Society Main Rd, Opposite Ruda-2, Sadguru Nagar, Rajkot, Gujarat 360005",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () async {
                                  // launch('tel://$number1');
                                },
                                icon: Icon(
                                  Icons.phone,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                ":  9824283615",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(55, 0, 0, 0),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () async {
                                  // launch('tel://$number1');
                                },
                                icon: Icon(
                                  Icons.mail,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                ":  mahavir33@gmail.com",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        CarouselSlider(
                          options: CarouselOptions(
                            enableInfiniteScroll: false,
                            enlargeCenterPage: true,
                            autoPlay: true,
                          ),
                          items: [
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 19, 0, 19),
                                decoration: BoxDecoration(
                                  border:
                                  Border.all(color: Colors.red, width: 3),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Image.asset('assets/garage5.jpg')),
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 19, 0, 19),
                                decoration: BoxDecoration(
                                  border:
                                  Border.all(color: Colors.red, width: 3),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Image.asset('assets/garage5_2.jpg'))
                          ],
                        ),
                      ],
                    ),
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
