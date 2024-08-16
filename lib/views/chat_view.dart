import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsapp/constants.dart';
import 'package:whatsapp/models/message_model.dart';
import 'package:whatsapp/widgets/chat_bubble.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});
  static String id = "ChatView";
  TextEditingController controller = TextEditingController();
  ScrollController scrollController = ScrollController();
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollections);
  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
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
      body: StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy("createdAt", descending: true).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            List<MessageModel> messageList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messageList.add(MessageModel.fromJson(snapshot.data!.docs[i]));
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: scrollController,
                    itemCount: messageList.length,
                    itemBuilder: (context, index) {
                      if (messageList[index].id == email) {
                        return ChatBubble(
                          message: messageList[index],
                        );
                      } else {
                        return ChatBubbleForFriends(
                            message: messageList[index]);
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (value) {
                      messages.add(
                        {
                          kMessage: value,
                          "createdAt": DateTime.now(),
                          "id": email
                        },
                      );
                      scrollController.animateTo(0,
                          duration: Duration(
                            seconds: 1,
                          ),
                          curve: Curves.easeIn);
                      controller.clear();
                    },
                    decoration: InputDecoration(
                      suffix: GestureDetector(
                        onTap: () {
                          messages.add(
                            {
                              kMessage: controller.text,
                              "createdAt": DateTime.now(),
                              "id": email
                            },
                          );
                          scrollController.animateTo(0,
                              duration: Duration(
                                seconds: 1,
                              ),
                              curve: Curves.easeIn);
                          controller.clear();
                        },
                        child: Icon(
                          Icons.send,
                          color: kPrimarykey,
                        ),
                      ),
                      hintText: "New Message",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: kPrimarykey, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimarykey, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimarykey, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                )
              ],
            );
          } else {
            return Text("no data");
          }
        },
      ),
    );
  }
}
