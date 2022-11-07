import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/product_model.dart';
import '../../services/product_services.dart';

class ProductController extends GetxController {
  var productList = <ProductModels>[].obs;
  var isLoading = true.obs;
   var favList = <ProductModels>[].obs;
   var favStorage = GetStorage();

   TextEditingController searchController = TextEditingController();
   var searchList = <ProductModels>[].obs;


  @override
  void onInit() {
    super.onInit();
    getProducts();
    List? favoritesStorage = favStorage.read<List>("isFavList");
    if (favoritesStorage != null) {
     favList = favoritesStorage.map((e) =>
     ProductModels.fromJson(e)).toList().obs;
    }
  }

  void getProducts() async {
    var products = await ProductServices.getProduct();

    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  //logic to add favorites
 void manageFav(int productId) async{
    var elementIndex = favList.indexWhere((element) => element.id==productId);
    if(elementIndex>=0)
    {
      favList.removeAt(elementIndex);
      await favStorage.remove("isFavList");
    }
    else
    {
      favList.add(
          productList.firstWhere((element) => element.id==productId,
          ));
     await favStorage.write("isFavList", favList);
    }
 }

  bool isFav(int productId){
    return favList.any((element) => element.id==productId);
  }

  void clearSearch(){
    searchController.clear();
    // مش فاهمها
    addToSearchList("");
    // searchList.clear();
  }

  void addToSearchList(String searchName){
    searchName = searchName.toLowerCase();
    searchList.value = productList.where((search){
      var searchTitle = search.title.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();
      return searchTitle.contains(searchName) ||
          searchPrice.toString().contains(searchName);
    }).toList();

    update();
  }


}