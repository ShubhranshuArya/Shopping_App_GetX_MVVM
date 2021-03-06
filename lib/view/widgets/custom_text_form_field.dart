import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final String hint;
  final Function validator;
  final Function onSaved;

  const CustomTextFormField({
    this.text,
    this.hint,
    this.validator,
    this.onSaved,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            text: text,
            fontSize: 14,
            color: Colors.grey.shade900,
          ),
          TextFormField(
            validator: validator,
            onSaved: onSaved,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey),
              fillColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
