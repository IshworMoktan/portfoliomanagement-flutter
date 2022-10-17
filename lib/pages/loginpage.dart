import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:portfoliomanagement/auth_service.dart';


import 'homepage.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}



class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              Colors.grey,
            ],
          ),
        ),
        child: Card(
          margin: const EdgeInsets.only(top: 200, bottom: 200, left: 30, right: 30),
          elevation: 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "   PORTFOLIO \n MANAGEMENT",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),

              //google sign in button
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: MaterialButton(
                  color: Colors.teal[300],
                  elevation: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 30.0,
                        width: 30.0,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Icon(FontAwesomeIcons.google),
                      const Text(
                        " Sign In with Google ",
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),

                  // by onpressed we call the function signup function
                  onPressed: () {

                    AuthService().signInWithGoogle();
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );



  }
}
