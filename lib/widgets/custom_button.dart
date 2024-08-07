import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      height: MediaQuery.of(context).size.height * 0.08,
      width: double.infinity,
      child: Center(
          child: Text(
        "Sign in",
        style: TextStyle(color: Colors.white, fontSize: 20),
      )),
    );
  }
}
