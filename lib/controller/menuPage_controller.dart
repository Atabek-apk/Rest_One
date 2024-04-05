import 'dart:math';

import 'package:rest_one/Models/userId_orders_response_model.dart';
import 'package:rest_one/constants/file_assistans.dart';
import 'package:rest_one/service/category_service.dart';
import 'package:rest_one/service/get_orders_ byUserId_service.dart';
import 'package:rest_one/service/product_service.dart';


class MenuPageController extends GetxController {
  static MenuPageController instance = Get.find();
  RxList<TachBanner> bannerList = List<TachBanner>.empty(growable: true).obs;
  RxList<TachCategory> categoryList = List<TachCategory>.empty(growable: true).obs;
  RxList<TachProduct> productList = List<TachProduct>.empty(growable: true).obs;
  RxList<UserIdResponseOrders> orderproductList = List<UserIdResponseOrders>.empty(growable: true).obs;
  RxBool isBannerLoading = false.obs;
  RxBool isCategoryLoading = false.obs;
  RxBool isProductLoading = false.obs;
  RxBool isOrderProductLoading = false.obs;
  @override
  void onInit() {
    getDataBanner();
    getDataCategory();
    getDataProduct();

    super.onInit();
  }

  // getOrderDataProduct();

  void getDataBanner() async {
    try{
      isBannerLoading(true);
      var result = await TachServiceBanner().getBanner();
      if(result != null){
        bannerList.assignAll(tachBannerListFromJson(result.body));
      }
    } catch(e) {
      print("Error Banner : ${e}");
    } finally {
      print("Get Data Banner");
      isBannerLoading(false);
    }
  }

  void getDataCategory() async {
    try{
      isCategoryLoading(true);
      var result = await TachServiceCategorys().getCategorys();
      if(result != null){
        categoryList.assignAll(tachCategoryListFromJson(result.body));
        // categoryList.assignAll(tachCategoryListFromJson(result.body));
      }
    } catch(e) {
      print("Error Category : ${e}");
    } finally {
      print("Get Data Category");
      isCategoryLoading(false);
    }
  }

  void getDataProduct() async {
    try{
      isProductLoading(true);
      var result = await TachServiceProducts().getProduct();
      if(result != null){
        productList.assignAll(tachProductListFromJson(result.body));
      }
    } catch(e) {
      print("Error Product : ${e}");
    } finally {
      print("Get Data Product");
      isProductLoading(false);
    }
  }

  // void getOrderDataProduct() async {
  //   try{
  //     isOrderProductLoading(true);
  //     var result = await TachServiceGetOrdersById().getUserIDOrders();
  //     if(result != null){
  //       orderproductList.assignAll(userIdOrdersResponseFromJson(result.body));
  //     }
  //   } catch(e) {
  //     print("Error Order Product : ${e}");
  //   } finally {
  //     print("Get Order Data Product");
  //     isOrderProductLoading(false);
  //   }
  // }
}