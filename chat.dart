import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:trial/Signup.dart';
// import 'package:trial/login.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'chatmessage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ChatBot'),
          backgroundColor: Colors.purple[800],
        ),
        body: MyForm(),
        // bottomNavigationBar: NavBar(),
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
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];
  TextEditingController _text = TextEditingController(text: "");
  ScrollController listScroll = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                height: (context.height * 0.75),
                child: ListView.builder(
                  // itemCount: 5,
                  controller: listScroll,
                  itemCount: messages.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 10, bottom: 10),
                      child: Align(
                        alignment: (messages[index].messageType == "receiver"
                            ? Alignment.topLeft
                            : Alignment.topRight),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(messages[index].messageType == "receiver"
                                ? Icons.person_2
                                : null),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:
                                    (messages[index].messageType == "receiver"
                                        ? Colors.grey.shade200
                                        : Colors.purple[200]),
                              ),
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                messages[index].messageContent,
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                            Icon(messages[index].messageType == "sender"
                                ? Icons.person_2_outlined
                                : null),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(5),
                child: RawKeyboardListener(
                  focusNode: FocusNode(),
                  onKey: (event) async {
                    if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
                      var newMessage = ChatMessage(
                          messageContent: _text.text, messageType: "sender");
                      messages.add(newMessage);
                      _text.text = "";
                      setState(() {});

                      FocusManager.instance.primaryFocus?.unfocus();
                      await Future.delayed(const Duration(milliseconds: 25));
                      listScroll.jumpTo(listScroll.position.maxScrollExtent);
                    }
                  },
                  child: TextFormField(
                    // key: ,
                    controller: _text,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () async {
                          var newMessage = ChatMessage(
                              messageContent: _text.text,
                              messageType: "sender");
                          messages.add(newMessage);
                          _text.text = "";
                          setState(() {});

                          FocusManager.instance.primaryFocus?.unfocus();
                          await Future.delayed(
                              const Duration(milliseconds: 25));
                          listScroll
                              .jumpTo(listScroll.position.maxScrollExtent);
                        },
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2, color: Colors.purple.shade800),
                          borderRadius: BorderRadius.circular(25)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2, color: Colors.purple.shade800),
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
