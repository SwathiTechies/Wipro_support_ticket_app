import 'package:get/get.dart';
import 'package:wipro_ticket/model/category_model.dart';
import 'package:wipro_ticket/model/sub_category_model.dart' as scm;
import '../model/sub_category_model.dart';
import '../services/category_api.dart';

class CategoryController extends GetxController {
  final CategoryApiServices cApiServices = CategoryApiServices();

  Rx<CategoryModel> categoryModel = CategoryModel().obs;
  Rx<SubCategoryModel> subCategoryModel = SubCategoryModel().obs;

  var isLoading = false.obs;

  void fetchCategory() async {
    try {
      isLoading(true);
      var categoryData = await cApiServices.getCategory();
      print(categoryData);
      categoryModel.value = CategoryModelFromJson(categoryData.body); // Assign the API response to the list
    } catch (e) {
      print("Error fetching Category: $e");
    } finally {
      isLoading(false);
    }
  }

  void postSubCategory(int id) async {
    try {
      isLoading(true);
      var subCategoryData = await cApiServices.subCategoryPost(id);
      print('$subCategoryData');
      subCategoryModel.value = subCategoryModelFromJson(subCategoryData.body);
      print("Parsed Sub-Category Model: ${subCategoryModel.value.data}");
    } catch (e) {
      print("Error posting sub-Category: $e");
    } finally {
      isLoading(false);
    }
  }

  void updateSubCategoryDropdown(List<scm.Datum> subCategories) {
    subCategoryModel.value.data = subCategories;
    update(); // Trigger UI update
  }

}