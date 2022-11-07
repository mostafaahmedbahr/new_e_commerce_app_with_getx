import 'package:get/get.dart';
import 'package:new_e_commerce_app/models/product_model.dart';

class CartController extends GetxController
{

  var productsMap = {}.obs;

  void addProductToCart(ProductModels productModels){
    if(productsMap.containsKey(productModels))
    {
      productsMap[productModels]+=1;
     }
    else
    {
      productsMap[productModels]=1;
    }
  }

  void removeProductsFromCart(ProductModels productModels){
    if(productsMap.containsKey(productModels)&& productsMap[productModels]==1)
    {
      productsMap.removeWhere((key, value) => key==productModels);
     }
    else
    {
      productsMap[productModels]-=1;
    }
  }

  void removeOneProduct(ProductModels productModels){
    productsMap.removeWhere((key, value) => key==productModels);
   }

  void clearAllProducts(){
    productsMap.clear();
  }

  get productSubTotal=>productsMap.entries.map((e) =>
  e.key.price * e.value).toList();

  get total=>productsMap.entries.map((e) =>
  e.key.price * e.value).
  reduce((value, element) => value+element)
      .toStringAsFixed(2);

  int quantity()
  {
    if(productsMap.isEmpty)
    {
      return 0;
    }
    else
    {
      return productsMap.entries.map((e) => e.value )
          .toList()
          .reduce((value, element)
      => value+element);
    }

  }
}