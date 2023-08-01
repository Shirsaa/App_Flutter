import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trial/Signup.dart';
import 'package:trial/login.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: '/login', page: () => MyLoginPage()),
        GetPage(name: '/signup', page: () => MySignupPage()),
      ],
      home: Scaffold(
        body: MyForm(),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  MyFormState createState() {
    return MyFormState();
  }
}

class MyFormState extends State<MyForm> {
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background_ui_8.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          child: Center(
            // child: Form(
            //   key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: 50),
                  child: Text(
                    'Welcome',
                    style: GoogleFonts.lobster(
                      textStyle: const TextStyle(
                          fontSize: 64,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              offset: Offset(2, 2),
                            )
                          ]),
                    ),
                  ),
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Get.toNamed('/login');
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple[800],
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20)),
                        child: Text(
                          'Login',
                          style: GoogleFonts.cookie(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.toNamed('/signup');
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple[800],
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20)),
                        child: Text(
                          'Sign Up',
                          style: GoogleFonts.cookie(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ),
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
