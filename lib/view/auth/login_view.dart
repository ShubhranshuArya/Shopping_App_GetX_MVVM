import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase_todo_app/constants.dart';
import 'package:getx_firebase_todo_app/core/view_model/auth_view_model.dart';
import 'package:getx_firebase_todo_app/view/auth/register_view.dart';
import 'package:getx_firebase_todo_app/view/widgets/custom_button.dart';
import 'package:getx_firebase_todo_app/view/widgets/custom_button_social.dart';
import 'package:getx_firebase_todo_app/view/widgets/custom_text.dart';
import 'package:getx_firebase_todo_app/view/widgets/custom_text_form_field.dart';

/* Getwidget will give us a controller to call all the functions declared in it
Here we're setting the type of controller to authviewmodel hence we just have
to call controller and add use all the functions declared in the class.
*/
class LoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Welcome,",
                    fontSize: 30,
                  ),
                  GestureDetector(
                    onTap: () => Get.to(RegisterView()),
                    child: CustomText(
                      text: "Sign Up",
                      color: primaryColor,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              CustomText(
                text: "Sign In to continue",
                fontSize: 14,
                color: Colors.grey,
              ),
              SizedBox(height: 30),
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
              SizedBox(
                height: 40,
              ),
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
              SizedBox(height: 10),
              CustomText(
                text: "Forgot Password?",
                alignment: Alignment.topRight,
              ),
              SizedBox(height: 10),
              CustomButton(
                text: "Sign In",
                onPressed: () {
                  _formKey.currentState.save();
                  if (_formKey.currentState.validate()) {
                    controller.signInWithEmailAndPassword();
                  }
                },
              ),
              SizedBox(height: 40),
              CustomText(
                text: "-OR-",
                alignment: Alignment.center,
                fontSize: 24,
              ),
              SizedBox(height: 40),
              CustomButtonSocial(
                text: "Sign In with FaceBook.",
                onPressed: () {
                  /* Now here we can uncomment this function after adding 
                  sha key and all the other docs required for facebookSignIn
                  */

                  controller.facebookSignInMethod();
                },
              ),
              SizedBox(height: 10),
              CustomButtonSocial(
                text: "Sign In with Google.",
                onPressed: () {
                  /* Now here we can uncomment this function after adding 
                  sha key and all the other docs required for googlesignin
                  */

                  // controller.googleSignInMethod();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
