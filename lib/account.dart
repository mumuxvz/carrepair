import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myfinalcar/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfinalcar/loginscreen.dart';
class account extends StatefulWidget {
  const account({Key? key}) : super(key: key);

  @override
  _accountState createState() => _accountState();
}

class _accountState extends State<account> {
  User? user = FirebaseAuth.instance.currentUser;
  Usermodel loggedInUser = Usermodel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = Usermodel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text("Your Account"),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Text(
              "Your Profile",
              style: TextStyle(fontWeight: FontWeight.w600,
                  fontSize: 30,
                  color: Colors.white),
            ),
            Stack(
              children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "5bwDKrjxQVAlDo-g:1653472828757&tbm=isch&source=iu&ictx=1&vet=1&fir=H6pHpB03ZEAgeM%252Cwg0CyFWNfK7o5M%252C_%253BXzC2iXNqhm0dvM%252CFvQHUVZ-cx81xM%252C_%253BQsatBu9zpFWl5M%252CFvQHUVZ-cx81xM%252C_%253BnfkyptoYx2OzJM%252CFvQHUVZ-cx81xM%252C_%253BkevY2s_U4GhnjM%252C_wo3Wk6WMCa34M%252C_%253BK3TYQSDHIhDw4M%252CFvQHUVZ-cx81xM%252C_%253Blcjtk8drNcGL8M%252COgWk3wP_2xVHMM%252C_%253BeHQKa74ZnnpTfM%252C4XfudSI_3wLzPM%252C_%253BkEuHdfl2sp9d1M%252COgWk3wP_2xVHMM%252C_%253BSlRNEOT2u4NZMM%252CvHE8fi6UVRb6jM%252C_%253BeigZHqcWe_a-1M%252C-BM1FZGE2YqECM%252C_%253BWgxrqZ8j04F8BM%252Cw0rekurKV2OhcM%252C_%253BBTSIUzVfMCSJHM%252CD8AD4jb-ysfxGM%252C_%253BioYoSGPe9jA2IM%252C_lgUfa9iUIcUwM%252C_%253Bfzm-cB-sF1nIvM%252C4XfudSI_3wLzPM%252C_%253BoQ0j0NMQEtlCFM%252CF98XHpaQ1btC6M%252C_%253BnyFMOkQaK3q9eM%252CDFlrvMtp2WJ07M%252C_&usg=AI4_-kTXCwGqkWsJTXs9DcfCSm1A8HRIYQ&sa=X&ved=2ahUKEwiG9emksvr3AhW9S2wGHb1sCDQQ9QF6BAggEAE#imgrc=lcjtk8drNcGL8M"),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),

    );
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}