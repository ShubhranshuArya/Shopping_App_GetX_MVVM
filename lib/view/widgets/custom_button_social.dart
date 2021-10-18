import 'package:flutter/material.dart';
import 'package:getx_firebase_todo_app/view/widgets/custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  final String text;
  final Function onPressed;

  const CustomButtonSocial({
    this.text,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.shade700,
          width: 2,
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: CustomText(
          text: text,
          alignment: Alignment.center,
          color: Colors.grey.shade700,
          fontSize: 20,
        ),
      ),
    );
  }
}
