import 'package:get/get.dart';
import 'package:testappfirst/home/main_page1.dart';
import 'package:testappfirst/pages/food/popular_details.dart';

import '../pages/food/recommended_food_details.dart';
class RouteHelper{
  static const String initial="/";
  static const String popularFood="/popular-food";
  static const String recommendedFood="/recommended-food";

  static String getInitial()=>'$initial';
  static String getPopularFood()=>'$popularFood';
  static String getRecommendedFood()=>'$recommendedFood';

  static List<GetPage> routes=[
    GetPage(name: initial, page: ()=>MainFoodPage()),

    GetPage(name: popularFood, page: (){

      //print("popular food get called");
      return PopularFoodDetail();
    },
        transition: Transition.fadeIn
    ),

    GetPage(name: recommendedFood, page: (){

      //print("popular food get called");
      return RecommendedFoodDetail();
    },
        transition: Transition.fadeIn
    )
  ];
}