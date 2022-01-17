import 'package:get/get.dart';
import 'package:getx_workplace/feature/model/product_model.dart';
import 'package:getx_workplace/feature/service/network_service.dart';

class ProductController extends GetxController{
var isLoading=true.obs;
var productList=<ProductModel>[].obs;
@override
  void onInit() {
    fetchProducts();
    super.onInit();
  }
  void fetchProducts()async{
    try {
      isLoading(true);
      var products=await NetworkService.fetchProducts();
      if (products.isNotEmpty) {
        productList.assignAll(products);
      } else {
      }
    } finally  {
      isLoading(false);
    }
  }
}
