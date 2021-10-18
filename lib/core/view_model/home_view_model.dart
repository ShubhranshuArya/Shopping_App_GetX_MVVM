import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_firebase_todo_app/core/services/home_services.dart';
import 'package:getx_firebase_todo_app/model/category_model.dart';
import 'package:getx_firebase_todo_app/model/product_model.dart';

class HomeViewModel extends GetxController {
  List<CategoryModel> _categoryModel = [];
  List<ProductModel> _productModel = [];
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoryModel> get categoryModel => _categoryModel;
  List<ProductModel> get productModel => _productModel;
  ValueNotifier<bool> get loading => _loading;

  HomeViewModel() {
    getCategory();
    getBestSellingProducts();
  }

  getCategory() async {
    _loading.value = true;
    HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(value[i].data()));
        _loading.value = false;
      }
      update();
    });
  }

  getBestSellingProducts() async {
    _loading.value = true;
    HomeService().getProduct().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(ProductModel.fromJson(value[i].data()));
        _loading.value = false;
      }
      update();
    });
  }
}
