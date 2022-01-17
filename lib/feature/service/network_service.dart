import 'package:getx_workplace/feature/model/product_model.dart';
import 'package:http/http.dart' as http;
class NetworkService{
  static var client =http.Client();

  static Future<List<ProductModel>>fetchProducts() async {
    var response = await client.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode==200) {
      var jsonString = response.body;
      return productModelFromJson(jsonString);
    }
    else{
      throw Exception();
    }

  }
}