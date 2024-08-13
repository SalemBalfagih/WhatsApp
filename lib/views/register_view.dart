import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/constants.dart';
import 'package:whatsapp/helper/show_snackbar.dart';
import 'package:whatsapp/widgets/custom_button.dart';
import 'package:whatsapp/widgets/custom_textfield.dart';

class RegisterView extends StatefulWidget {
  RegisterView({super.key});
  static String id = "RegisterView";

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String? emailAddress, password;
  bool isloading = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: kLinearGradient),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: Image.asset(klogo)),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "WELCOME TO WHATSAPP",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kPrimarykey,
                          fontFamily: "Caveat"),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Container(
                  width: double.infinity,
                  child: const Text(
                    "Register",
                    style: TextStyle(fontSize: 20, color: kPrimarykey),
                    textAlign: TextAlign.left,
                  ),
                ),
                CustomTextFromField(
                  onChanged: (data) {
                    emailAddress = data;
                  },
                  hintText: "Enter your Email",
                ),
                CustomTextFromField(
                  onChanged: (data) {
                    password = data;
                  },
                  hintText: "Enter your Password",
                ),
                isloading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: kPrimarykey,
                        ),
                      )
                    : CustomButton(
                        onTap: () async {
                          isloading = true;
                          setState(() {});
                          if (formKey.currentState!.validate()) {
                            try {
                              await registerUser();
                              showSnackBar(context, "Registered Successfully",
                                  Colors.green);
                              Navigator.of(context).pop();
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                showSnackBar(
                                    context,
                                    "Password Provided is too Weak",
                                    Colors.red);
                              } else if (e.code == 'email-already-in-use') {
                                showSnackBar(context, "Account Already exists",
                                    Colors.red);
                              }
                            } catch (ex) {
                              showSnackBar(context, ex.toString(), Colors.red);
                            }
                          }
                          isloading = false;
                          setState(() {});
                        },
                        text: "Register",
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(color: kPrimarykey),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }

  Future<void> registerUser() async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress!,
      password: password!,
    );
  }
}
