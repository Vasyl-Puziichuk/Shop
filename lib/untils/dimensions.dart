import 'package:get/get.dart';

class Dimensions{
  //820
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight/2.65;//2.56
  static double pageViewContainer = screenHeight/3.89;//3.72
  static double pageViewTextContainer = screenHeight/7.08;//7.03
  //динамічна висота відступів
  static double height10=screenHeight/84.72;//82
  static double height15=screenHeight/56.32;//51
  static double height20=screenHeight/42.52;//41
  static double height30=screenHeight/28.45;//28.45
  static double height45=screenHeight/17;//41
  static double height55=screenHeight/15;


  //динамічна ширина відступів
  static double width10=screenHeight/84.72;//82
  static double width15=screenHeight/56.32;//51
  static double width20=screenHeight/42.52;//41
  static double width30=screenHeight/28.45;//41

  //Розміри шрифта
  static double font16=screenHeight/53;
  static double font20=screenHeight/42.52;
  static double font26=screenHeight/32.45;


  static double radius15=screenHeight/56.6;
  static double radius20=screenHeight/42.52;
  static double radius30=screenHeight/28.18;

  //розміри іконок
  static double iconSize28 = screenHeight/35;
  static double iconSize22 = screenHeight/38;


  //Розміри для відображення картинок з текстом
  static double listViewImgSize = screenWidth/3.55;
  static double listViewTextContSize = screenWidth/4.2;

  //популярні замовлення
  static double popularFoodImgSize=screenHeight/2.7;

  //Висота нижнього меню
  static double bottomHeightBar=screenHeight/7.08;

  //Екран завантаження додатку
  static double splashImg=screenHeight/3.35;

}