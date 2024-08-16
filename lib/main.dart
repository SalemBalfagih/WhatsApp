import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:whatsapp/constants.dart';

import 'package:whatsapp/firebase_options.dart';
import 'package:whatsapp/views/chat_view.dart';
import 'package:whatsapp/views/login_view.dart';
import 'package:whatsapp/views/register_view.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  return runApp(const WhatsApp());
}

class WhatsApp extends StatelessWidget {
  const WhatsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: kPrimarykey,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: LoginView.id,
      routes: {
        LoginView.id: (context) => LoginView(),
        RegisterView.id: (context) => RegisterView(),
        ChatView.id: (context) => ChatView(),
      },
    );
  }
}
