import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsapp/widgets/custom_button.dart';
import 'package:whatsapp/widgets/custom_textfield.dart';

void main(List<String> args) {
  return runApp(const WhatsApp());
}

class WhatsApp extends StatelessWidget {
  const WhatsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
          child: Column(
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Image.asset("assets/images/whatsapp_480px.png")),
              const Text(
                "WELCOME TO WHATSAPP",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontFamily: "Caveat"),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  "Sign in",
                  style: TextStyle(fontSize: 20, color: Colors.green),
                  textAlign: TextAlign.left,
                ),
              ),
              const CustomTextField(
                hintText: "Enter your Email",
              ),
              const CustomTextField(
                hintText: "Enter your Password",
              ),
              CustomButton(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sign up",
                        style: TextStyle(color: Colors.green),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
