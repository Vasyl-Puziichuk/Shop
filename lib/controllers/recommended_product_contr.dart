import 'package:get/get.dart';
import 'package:testappfirst/data/repository/popular_product_repo.dart';

import '../data/repository/recommended_product_repo.dart';
import '../models/popular_products_model.dart';

class RecommendedProductController extends GetxController{
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});
  List<dynamic> _recommendedProductList=[];
  List<dynamic>  get recommendedProductList =>_recommendedProductList;

  bool _isLoaded =false;
  bool  get isLoaded=>_isLoaded;

  Future<void> getRecommendedProductList()async {
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if(response.statusCode==200){

     // print("got products recommended OK");
      _recommendedProductList=[];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      // print(_popularProductList);
      _isLoaded=true;
      update();
    }
    else{
      print("could not get products recommended");
    }
  }
}