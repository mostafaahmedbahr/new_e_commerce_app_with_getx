import 'package:get/get.dart';
import 'package:new_e_commerce_app/models/product_model.dart';
import 'package:new_e_commerce_app/services/category_services.dart';

class CategoryController extends GetxController
{
var categoryNameList = <String>[].obs;
var isCategoryLoading = false.obs;
var isAllCategory = false.obs;
var categoryList = <ProductModels>[].obs;

List<String> imageCategory = [
  "https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_.jpg",
  "https://fakestoreapi.com/img/51UDEzMJVpL._AC_UL640_QL65_ML3_.jpg",
  "https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg",
  "https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg"

];
  @override
  void onInit()
  {
    super.onInit();
    getCategorys();
  }

void getCategorys() async
{
  var categoryName = await CategoryServices.getCategory();
  try {
    isCategoryLoading(true);
    if(categoryName.isNotEmpty)
    {
      categoryNameList.addAll(categoryName);
    }
  }
  finally
  {
    isCategoryLoading(false);
  }
}

void getAllCategorys(String nameCategory) async
{
  var categoryName = await AllCategoryServices.getAllCategories(nameCategory);

  try {
    isAllCategory(true);
    if(categoryName.isNotEmpty)
    {
      categoryList.value = categoryName;
    }
  }
  finally
  {
    isAllCategory(false);
  }
}
}
