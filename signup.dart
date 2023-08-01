import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MySignupPage());

class MySignupPage extends StatelessWidget {
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
  final userIdController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  @override
  void dispose() {
    firstnameController.dispose();
    lastnameController.dispose();
    userIdController.dispose();
    passwordController.dispose();
    confirmController.dispose();
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
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text(
                      'Sign Up',
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
                      )
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(6),
                    width: 300,
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                      decoration: InputDecoration(
                        labelText: "First name",
                        labelStyle: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                        fillColor: Colors.blue.shade50.withOpacity(0.52),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.brown.shade900)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.teal.shade900)),
                        hintText: 'Enter your first name',
                      ),
                      controller: firstnameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your first name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(6),
                    width: 300,
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                      decoration: InputDecoration(
                        labelText: "Last Name",
                        labelStyle: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                        fillColor: Colors.blue.shade50.withOpacity(0.52),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.brown.shade900)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.teal.shade900)),
                        hintText: 'Enter your last name',
                      ),
                      controller: lastnameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your last name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(6),
                    width: 300,
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                      decoration: InputDecoration(
                        labelText: "User Id",
                        labelStyle: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                        fillColor: Colors.blue.shade50.withOpacity(0.52),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.brown.shade900)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.teal.shade900)),
                        hintText: 'Enter User id',
                      ),
                      obscureText: true,
                      controller: userIdController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter user id';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(6),
                    width: 300,
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                        fillColor: Colors.blue.shade50.withOpacity(0.52),
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
                  Container(
                    margin: const EdgeInsets.all(6),
                    width: 300,
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                      decoration: InputDecoration(
                        labelText: "Confirm Password",
                        labelStyle: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                        fillColor: Colors.blue.shade50.withOpacity(0.52),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.brown.shade900)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.teal.shade900)),
                        // errorBorder: const OutlineInputBorder(
                        //     borderSide:
                        //         BorderSide(width: 2, color: Colors.red)),
                        hintText: 'Confirm password',
                      ),
                      obscureText: true,
                      controller: confirmController,
                      validator: (value) {
                        RegExp regex = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&_*~]).{8,}$');
                        if (value == null || value.isEmpty) {
                          return 'Enter your last name';
                        } else {
                          if (!regex.hasMatch(value)) {
                            return 'password should contain one uppercase, one lowercase, and number and one special character';
                          } else {
                            if (passwordController.text !=
                                confirmController.text) {
                              return ('Password does not match');
                            }
                            ;
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
                          print(firstnameController.text.trim());
                          print(lastnameController.text.trim());
                          print(userIdController.text);
                          print(passwordController.text);
                        }
                        ;
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple.shade800,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Submit',
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
