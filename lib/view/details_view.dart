import 'package:flutter/material.dart';
import 'package:getx_firebase_todo_app/model/product_model.dart';
import 'package:getx_firebase_todo_app/view/widgets/custom_text.dart';

class DetailsView extends StatelessWidget {
  final ProductModel model;

  DetailsView({
    this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey,
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: CustomText(
                text: model.name,
                fontSize: 24,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 48,
                    width: 160,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Size",
                            alignment: Alignment.center,
                          ),
                          CustomText(
                            text: model.size,
                            alignment: Alignment.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 48,
                    width: 160,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Color",
                            alignment: Alignment.center,
                          ),
                          CircleAvatar(
                            radius: 12,
                            foregroundColor: Colors.green,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: CustomText(
                text: "Product Details",
                fontSize: 24,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: CustomText(
                text: model.description,
                fontSize: 20,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
