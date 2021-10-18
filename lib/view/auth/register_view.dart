import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase_todo_app/core/view_model/auth_view_model.dart';
import 'package:getx_firebase_todo_app/view/auth/login_view.dart';
import 'package:getx_firebase_todo_app/view/widgets/custom_button.dart';
import 'package:getx_firebase_todo_app/view/widgets/custom_text.dart';
import 'package:getx_firebase_todo_app/view/widgets/custom_text_form_field.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () => Get.off(LoginView()),
          child: Icon(
            Icons.chevron_left_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          right: 10,
          left: 10,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomText(
                text: "Sign Up,",
                fontSize: 30,
              ),
              SizedBox(height: 10),
              CustomText(
                text: "Register to continue",
                fontSize: 14,
                color: Colors.grey,
              ),
              SizedBox(height: 40),
              CustomTextFormField(
                text: "Name",
                hint: "Shubhrand",
                onSaved: (value) {
                  controller.name = value;
                },
                validator: (value) {
                  if (value == null) {
                    print("Error");
                  }
                },
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                text: "Email",
                hint: "tarand@gmail.com",
                onSaved: (value) {
                  controller.email = value;
                },
                validator: (value) {
                  if (value == null) {
                    print("Error");
                  }
                },
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                text: "Password",
                hint: "********",
                onSaved: (value) {
                  controller.password = value;
                },
                validator: (value) {
                  if (value == null) {
                    print("Error");
                  }
                },
              ),
              SizedBox(height: 60),
              CustomButton(
                text: "Register",
                onPressed: () {
                  _formKey.currentState.save();
                  if (_formKey.currentState.validate()) {
                    controller.createAccountWithEmailAndPassword();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
