import 'package:flutter/material.dart';
import 'package:whatsapp/constants.dart';
import 'package:whatsapp/widgets/chat_bubble.dart';
import 'package:whatsapp/widgets/custom_textfield.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});
  static String id = "ChatView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "WhatsApp ",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: "Caveat"),
            ),
            Image.asset(
              klogo,
              width: 40,
              height: 40,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return const ChatBubble();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomTextFromField(hintText: "hintText", onChanged: (v) {}),
          )
        ],
      ),
    );
  }
}
