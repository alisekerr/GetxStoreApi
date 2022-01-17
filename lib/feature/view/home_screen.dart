import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_workplace/feature/controllers/product_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.put(ProductController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Products"),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const CircularProgressIndicator();
        } else {
          return ListView.builder(
              itemCount: controller.productList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 150,
                          width: 100,
                          child: CachedNetworkImage(
                            imageUrl: controller.productList[index].image,
                            fit: BoxFit.fill,
                            placeholder: (context, url) =>
                                Image.asset("assets/basketicon.jpg"),
                            errorWidget: (context, url, error) =>
                                Image.asset("assets/basketicon.jpg"),
                          ),
                        ),
                        Flexible(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(controller.productList[index].title),
                            Text(
                                controller.productList[index].price.toString()),
                            Text(controller.productList[index].category)
                          ],
                        ))
                      ],
                    )
                  ],
                );
              });
        }
      }),
    );
  }
}
