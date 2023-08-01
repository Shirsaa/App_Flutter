import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyLoginPage());

class MyLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyForm(),
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
  final _formKey = GlobalKey<FormState>();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final useridController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  @override
  void dispose() {
    firstnameController.dispose();
    lastnameController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    useridController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.bottomCenter,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background_ui_8.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
            child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.deepPurple[200],
              // border: const Border(
              //   top: BorderSide(color: Colors.white, width: 10),
              //   left: BorderSide(color: Colors.white, width: 10),
              //   right: BorderSide(color: Colors.white, width: 10),
              //   bottom: BorderSide(color: Colors.white, width: 0),
              // ),
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(70), topRight: Radius.circular(70)),
              boxShadow: const [BoxShadow(color: Colors.black, offset: Offset(-3, -3), blurRadius: 75),],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                    child: Text(
                      'Log In',
                      style: GoogleFonts.oleoScript(
                        textStyle: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.w500,
                            color: Colors.purple[800],
                            shadows: const [
                              Shadow(
                                color: Colors.black,
                                offset: Offset(2, 1),
                              )
                            ]),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: 300,
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                      decoration: InputDecoration(
                        labelText: "User Id",
                        labelStyle: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                        fillColor: Colors.purple.shade50.withOpacity(0.52),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.brown.shade900)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.teal.shade900)),
                        hintText: 'Enter your User Id',
                      ),
                      controller: useridController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your User Id';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: 300,
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                        fillColor: Colors.purple.shade50.withOpacity(0.52),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.brown.shade900)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.teal.shade900)),
                        hintText: 'Enter password',
                      ),
                      obscureText: true,
                      controller: passwordController,
                      validator: (value) {
                        RegExp regex = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                        if (value == null || value.isEmpty) {
                          return 'Enter your last name';
                        } else {
                          if (!regex.hasMatch(value)) {
                            return 'password should contain one uppercase, one lowercase, and number and one special character';
                          } else {
                            return null;
                          }
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Get.snackbar(
                            "Message",
                            "Welcome User",
                          );
                          print(useridController.text);
                          print(passwordController.text);
                        }
                        ;
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple.shade800,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
