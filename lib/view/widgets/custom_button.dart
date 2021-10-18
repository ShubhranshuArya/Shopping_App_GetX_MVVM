import 'package:flutter/material.dart';
import 'package:getx_firebase_todo_app/view/widgets/custom_text.dart';

import '../../constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  CustomButton({
    this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        padding: EdgeInsets.all(18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        onPressed: onPressed,
        color: primaryColor,
        child: CustomText(
          text: text,
          alignment: Alignment.center,
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
