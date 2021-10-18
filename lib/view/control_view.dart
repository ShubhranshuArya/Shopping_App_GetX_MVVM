import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase_todo_app/core/view_model/auth_view_model.dart';
import 'package:getx_firebase_todo_app/core/view_model/control_view_model.dart';
import 'package:getx_firebase_todo_app/view/auth/login_view.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginView()
          : GetBuilder<ControlViewModel>(
              init: ControlViewModel(),
              builder: (controller) => Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: _bottomNavBar(),
              ),
            );
    });
  }

  Widget _bottomNavBar() {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            activeIcon: Text("Explore"),
            icon: Icon(Icons.home),
            label: "",
          ),
          BottomNavigationBarItem(
            activeIcon: Text("Cart"),
            icon: Icon(Icons.shopping_cart),
            label: "",
          ),
          BottomNavigationBarItem(
            activeIcon: Text("Profile"),
            icon: Icon(Icons.person),
            label: "",
          ),
        ],
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
        },
      ),
    );
  }
}
