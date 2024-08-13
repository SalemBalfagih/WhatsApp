import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/constants.dart';
import 'package:whatsapp/helper/show_snackbar.dart';
import 'package:whatsapp/views/chat_view.dart';
import 'package:whatsapp/views/register_view.dart';
import 'package:whatsapp/widgets/custom_textfield.dart';

import '../widgets/custom_button.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});
  static String id = "LoginView";
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isloading = false;

  String? emailAddress, password;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: kLinearGradient,
        ),
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
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
                    "Sign in",
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
                              await singInUser();
                              showSnackBar(context, "Registered Successfully",
                                  Colors.green);
                              Navigator.of(context).pushNamed(ChatView.id);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                showSnackBar(
                                    context, "user-not-found", Colors.red);
                              } else if (e.code == 'wrong-password') {
                                showSnackBar(
                                    context, 'wrong-password', Colors.red);
                              } else {
                                showSnackBar(context, e.toString(), Colors.red);
                              }
                            } catch (ex) {
                              showSnackBar(context, ex.toString(), Colors.red);
                            }
                          }
                          isloading = false;
                          setState(() {});
                        },
                        text: "Sign in",
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RegisterView.id);
                        },
                        child: const Text(
                          "Register",
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
  }

  Future<void> singInUser() async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailAddress!,
      password: password!,
    );
  }
}
