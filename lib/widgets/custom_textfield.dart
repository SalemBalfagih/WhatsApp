import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/constants.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({
    super.key,
    required this.hintText,
    required this.onChanged,
  });
  final String hintText;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "The filed is required";
              }
            },
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimarykey, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimarykey, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimarykey, width: 1),
              ),
            )));
  }
}
