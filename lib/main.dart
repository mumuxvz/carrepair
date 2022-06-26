import 'package:fluttertoast/fluttertoast.dart';
import 'package:cardone1/home1.dart';
import 'package:cardone1/homescreen.dart';
import 'package:cardone1/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cardone1/loginscreen.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async{
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DateTime timeback=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          final diffrence=DateTime.now().difference(timeback);
          final isexit=diffrence>=Duration(seconds: 2);
          timeback=DateTime.now();

          if(isexit){
            final message='press back again to exit';
            Fluttertoast.showToast(msg: message,fontSize: 18);
            return false;
          }
          else{
            Fluttertoast.cancel();
            return true;
          }
        },
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: Colors.black,
            ),
          ),
          home:HomePage()
      ),
    );
  }
}

