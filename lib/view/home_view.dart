import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:getx_firebase_todo_app/constants.dart';
import 'package:getx_firebase_todo_app/core/view_model/home_view_model.dart';
import 'package:getx_firebase_todo_app/view/details_view.dart';
import 'package:getx_firebase_todo_app/view/widgets/custom_text.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => controller.loading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                    left: 20,
                    right: 20,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _searchTextFormField(),
                        SizedBox(height: 20),
                        CustomText(
                          text: "Categories",
                          fontSize: 20,
                        ),
                        SizedBox(height: 20),
                        _listViewCategory(),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Best Selling",
                              fontSize: 20,
                            ),
                            CustomText(
                              text: "See All",
                              fontSize: 18,
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        _listViewProducts(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 100,
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemCount: controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.grey.shade300,
                  child: Icon(
                    Icons.shop,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                CustomText(
                  text: controller.categoryModel[index].name,
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _listViewProducts() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 300,
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemCount: controller.productModel.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(
                      DetailsView(
                        model: controller.productModel[index],
                      ),
                    );
                  },
                  child: Container(
                    height: 200,
                    width: 180,
                    color: Colors.grey,
                    child: Center(
                      child: Text("Image ${index + 1}"),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                CustomText(
                  text: controller.productModel[index].name,
                  fontSize: 24,
                ),
                SizedBox(height: 4),
                CustomText(
                  text: controller.productModel[index].description,
                  fontSize: 12,
                  color: Colors.grey,
                ),
                SizedBox(height: 8),
                CustomText(
                  text: controller.productModel[index].price,
                  fontSize: 24,
                  color: primaryColor,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search",
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
