import 'package:flutter/material.dart';
import 'package:getx_firebase_todo_app/constants.dart';
import 'package:getx_firebase_todo_app/view/widgets/custom_text.dart';

class CartView extends StatelessWidget {
  final List<Map<String, dynamic>> cartProducts = [
    {
      "name": "Prod1",
      "price": 250,
    },
    {
      "name": "Prod1",
      "price": 250,
    },
    {
      "name": "Prod1",
      "price": 250,
    },
    {
      "name": "Prod1",
      "price": 250,
    },
    {
      "name": "Prod1",
      "price": 250,
    },
    {
      "name": "Prod1",
      "price": 250,
    },
    {
      "name": "Prod1",
      "price": 250,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: cartProducts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                        left: 20,
                        right: 20,
                        bottom: 10,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            width: 120,
                            color: Colors.red,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 20,
                              top: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: cartProducts[index]["name"],
                                  fontSize: 20,
                                ),
                                CustomText(
                                  text:
                                      "₹${cartProducts[index]["price"].toString()}",
                                  fontSize: 18,
                                  color: primaryColor,
                                ),
                                SizedBox(height: 8),
                                Container(
                                  height: 32,
                                  width: 100,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              color: Colors.grey.shade100,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Total",
                          fontSize: 24,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: "₹1000",
                          fontSize: 20,
                          color: primaryColor,
                        ),
                      ],
                    ),
                    Container(
                      height: 40,
                      width: 140,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: CustomText(
                          text: "Pay Now",
                          color: Colors.white,
                          alignment: Alignment.center,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
