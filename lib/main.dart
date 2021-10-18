import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase_todo_app/helper/bindings.dart';
import 'package:getx_firebase_todo_app/view/control_view.dart';
import 'package:getx_firebase_todo_app/view/details_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      home: ControlView(),
      // home: DetailsView(),
    );
  }
}
