class AppConstants{
  static const String APP_NAME ="DBFood";
  static const int APP_VERSION=1;

  static const String BASE_URL="http://10.0.2.2:8000";//хост для роботи емулятора
  //http://127.0.0.1:8000 or localhost:8000 мої хости
  // http://mvs.bslmeiyu.com можна використати для роботи
  //http://10.0.2.2:8000 хост для андроід емулятора
  static const String POPULAR_PRODUCT_URI="/api/v1/products/popular";
  static const String RECOMMENDED_PRODUCT_URI="/api/v1/products/recommended";
  //static const String DRINKS_URI="/api/v1/products/drinks";
  static const String UPLOAD_URL="/uploads/";

  //user and auth end points
  static const String REGISTRATION_URI="/api/v1/auth/register";
  static const String LOGIN_URI="/api/v1/auth/login";
  static const String USER_INFO_URI="/api/v1/customer/info";

  static const String TOKEN="";
  static const String PHONE="";
  static const String PASSWORD="";
  static const String CART_LIST="cart-list";
  static const String CART_HISTORY_LIST="cart-history-list";

}