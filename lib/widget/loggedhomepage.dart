import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:portfoliomanagement/pages/homepage.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:portfoliomanagement/widget/login_widget.dart';

class LoggedHome extends StatelessWidget {
  const LoggedHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return const HomePage();
            } else if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong !'));
            } else {
              return const LoginWidget();
            }
          },
        ),
      );
}
