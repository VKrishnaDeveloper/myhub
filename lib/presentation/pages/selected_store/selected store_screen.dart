import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_hub_user/core/color/app_colors.dart';
import 'package:my_hub_user/core/constnats/constants.dart';
import 'package:my_hub_user/state_management/controllers/product_controller.dart';

import '../../../core/data/data.dart';
import '../../../core/model/model_class.dart';
import '../cart/cart_product_screen.dart';

class SelectedStoreScreen extends StatefulWidget {
  const SelectedStoreScreen({super.key});

  @override
  State<SelectedStoreScreen> createState() => _SelectedStoreScreenState();
}

class _SelectedStoreScreenState extends State<SelectedStoreScreen> {
  final CartController controller = Get.put(CartController());

  final CartController controll = Get.find();
  List<MyHubProductsModel> productModel = DataClassDataClass.productsList;

  @override
  void initState() {
    // productModel = DataClassDataClass.productsList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        title: const Text(
          "Kp Store3",
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                children: [
                  const Expanded(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "Mehidipatnam, Hyderabad,Telangana,India",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: const Icon(
                      Icons.notifications_active,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => CartProductsScreen());
                    },
                    child: Stack(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: const Icon(
                            Icons.shopping_cart,
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            border: Border.all(width: 2),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '${controll.producteCount}',
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            color: Colors.blue,
            child: const Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.yellow,
                ),
                Text(
                  "Get Direction",
                  style: TextStyle(color: Colors.yellow),
                )
              ],
            ),
          ),
          Container(
            height: 55,
            color: Colors.blue,
            child: Expanded(
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
                  /* -- Text and Icon -- */
                  hintText: "What are you looking for?",
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFFB3B1B1),
                  ), // TextStyle
                  suffixIcon: const Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.black54,
                  ), // Icon
                  /* -- Border Styling -- */
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                      width: 2.0,
                      color: Color(0xFFFF0000),
                    ), // BorderSide
                  ), // OutlineInputBorder
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                      width: 2.0,
                      color: Colors.grey,
                    ), // BorderSide
                  ), // OutlineInputBorder
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                      width: 2.0,
                      color: Colors.grey,
                    ), // BorderSide
                  ), // OutlineInputBorder
                ), // InputDecoration
              ), // TextField
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: productModel.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CatalogProductCard(
                      productsModel: productModel[index],
                    );
                  }))
        ],
      )),
    );
  }
}

class CatalogProductCard extends StatefulWidget {
  final MyHubProductsModel productsModel;

  CatalogProductCard({Key? key, required this.productsModel}) : super(key: key);

  @override
  State<CatalogProductCard> createState() => _CatalogProductCardState();
}

class _CatalogProductCardState extends State<CatalogProductCard> {
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey,
      color: Colors.white,
      child: Container(
        height: 100,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Container(
                  padding: const EdgeInsets.all(2), // Border width

                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20), // Image border
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(48), // Image radius
                      child: Image.asset(
                        widget.productsModel.productImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.productsModel.productTitle,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black45),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        Constants.rupee +
                            widget.productsModel.productPrice.toString(),
                        style: const TextStyle(color: Colors.black45),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.productsModel.productWeight.toString(),
                  style: const TextStyle(color: Colors.blue),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // setState(() {
                //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //       content: Text("${widget.productsModel.productTitle}")));
                // });

                setState(() {
                  cartController.addProduct(widget.productsModel);
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.yellow),
                child: const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.grey,
                        size: 23,
                      ),
                      Text(
                        "ADD",
                        style: TextStyle(color: Colors.black87),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}




//  Expanded(
//             child: ListView(
//               shrinkWrap: true,
//               physics: const ClampingScrollPhysics(),
//               children: DataClassDataClass.productsList
//                   .map(
//                     (store) => GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => SelectedStoreScreen()));
//                       },
//                       child:
                      
//                        Card(
//                         shadowColor: Colors.grey,
//                         color: Colors.white,
//                         child: Container(
//                           height: 100,
//                           alignment: Alignment.center,
//                           margin: const EdgeInsets.symmetric(
//                               vertical: 8.0, horizontal: 15.0),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Padding(
//                                   padding: const EdgeInsets.only(right: 15),
//                                   child: Container(
//                                     padding:
//                                         const EdgeInsets.all(2), // Border width

//                                     decoration: BoxDecoration(
//                                         color: Colors.blue,
//                                         borderRadius:
//                                             BorderRadius.circular(20)),
//                                     child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(
//                                           20), // Image border
//                                       child: SizedBox.fromSize(
//                                         size: const Size.fromRadius(
//                                             48), // Image radius
//                                         child: Image.asset(
//                                           store.productImage,
//                                           fit: BoxFit.cover,
//                                         ),
//                                       ),
//                                     ),
//                                   )),
//                               Expanded(
//                                 child: Container(
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Container(
//                                         alignment: Alignment.centerLeft,
//                                         child: Text(
//                                           store.productTitle,
//                                           style: const TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.black45),
//                                         ),
//                                       ),
//                                       Container(
//                                         alignment: Alignment.centerLeft,
//                                         child: Text(
//                                           Constants.rupee + store.productPrice,
//                                           style: const TextStyle(
//                                               color: Colors.black45),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 10.0),
//                                 child: Container(
//                                   alignment: Alignment.centerLeft,
//                                   child: Text(
//                                     store.productWeight,
//                                     style: const TextStyle(color: Colors.blue),
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(30),
//                                     color: Colors.yellow),
//                                 child: const Padding(
//                                   padding: EdgeInsets.all(6.0),
//                                   child: Row(
//                                     children: [
//                                       Icon(
//                                         Icons.add,
//                                         color: Colors.grey,
//                                         size: 23,
//                                       ),
//                                       Text(
//                                         "ADD",
//                                         style: TextStyle(color: Colors.black87),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   )
//                   .toList(),
//             ),
//           ),


