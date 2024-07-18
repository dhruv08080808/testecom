import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:testecom/screens/dashboardScreen.dart';

String? name, email, photoUrl;

class GoogleAuthentication extends StatefulWidget {
  @override
  _GoogleAuthenticationState createState() => _GoogleAuthenticationState();
}

class _GoogleAuthenticationState extends State<GoogleAuthentication> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> googleSignIn() async {
    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount?.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication?.accessToken,
      idToken: googleSignInAuthentication?.idToken,
    );

    final UserCredential userCredential =
        await _firebaseAuth.signInWithCredential(authCredential);
    final User user = userCredential.user!;

    assert(user.displayName != null);
    assert(user.email != null);
    assert(user.photoURL != null);

    setState(() {
      name = user.displayName;
      email = user.email;
      photoUrl = user.photoURL;
    });

    final User currentUser = _firebaseAuth.currentUser!;
    assert(currentUser.uid == user.uid);

    return 'Logged In';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      body: Container(
        child: Center(
          child: MaterialButton(
            color: Colors.red,
            onPressed: () => googleSignIn().then((_) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => DashboardScreen()),
              );
            }),
            child: Text('Google Login'),
          ),
        ),
      ),
    );
  }
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      body: Container(
        child: Center(
          child: Text(
            'Welcome, $name',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
