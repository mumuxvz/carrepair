import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
class sos extends StatefulWidget {
  const sos({Key? key}) : super(key: key);

  @override
  _sosState createState() => _sosState();
}

class _sosState extends State<sos> {
  final Completer<GoogleMapController> _controller=Completer();

  static const CameraPosition _kGooglePlex=CameraPosition(
    target: LatLng(21.17104619888153, 72.82967768865495),
    zoom: 14,
  );

  final List <Marker> _markers=const <Marker>[
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(21.203207019102155,72.79036820920413),
        infoWindow: InfoWindow(
            title: 'garage 1'
        )
    ),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(21.1866595, 72.8124231),
        infoWindow: InfoWindow(
            title: 'garage 2'
        )
    ),
    Marker(
        markerId: MarkerId('3'),
        position: LatLng(21.218215, 72.777346),
        infoWindow: InfoWindow(
            title: 'garage 3'
        )
    ),
    Marker(
        markerId: MarkerId('4'),
        position: LatLng(21.209467, 72.79515),
        infoWindow: InfoWindow(
            title: 'garage 4'
        )
    ),
    Marker(
        markerId: MarkerId('5'),
        position: LatLng(21.1652706, 72.776807),
        infoWindow: InfoWindow(
            title: 'garage 5'
        )
    ),
    Marker(
        markerId: MarkerId('6'),
        position: LatLng(21.1876166, 72.8163833),
        infoWindow: InfoWindow(
            title: 'garage 7'
        )
    ),
    Marker(
        markerId: MarkerId('7'),
        position: LatLng(21.2349468, 72.8605523),
        infoWindow: InfoWindow(
            title: 'garage 6'
        )
    ),
    Marker(
        markerId: MarkerId('8'),
        position: LatLng(21.1355655, 72.7745053),
        infoWindow: InfoWindow(
            title: 'garage 8'
        )
    ),

  ];

  Future<Position> getUserCurrentLoaction() async{
    await Geolocator.requestPermission().then((value){


    }).onError((error, stackTrace) {
      print("error"+error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
        title: Center(
          child: Text('map'),
        ),
      ),
      body:GoogleMap(
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        zoomControlsEnabled: false,
        initialCameraPosition: _kGooglePlex,
        markers: Set<Marker>.of(_markers),
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     getUserCurrentLoaction().then((value)async{
      //       print(value.latitude.toString()+"  "+value.longitude.toString());
      //       _markers.add(
      //           Marker(
      //               markerId: MarkerId('2'),
      //               position: LatLng(value.latitude,value.longitude),
      //               infoWindow: InfoWindow(
      //                   title:  'your location'
      //               )
      //           )
      //       );
      //       CameraPosition cameraPosition=CameraPosition(zoom:14,target:  LatLng(value.latitude,value.longitude));
      //       final GoogleMapController controller=await _controller.future;
      //       controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      //       setState(() {
      //
      //       });
      //
      //     });
      //   },
      // ),


    );
  }
}