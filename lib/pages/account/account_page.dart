import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:testappfirst/controllers/auth_controller.dart';
import 'package:testappfirst/controllers/cart_controller.dart';
import 'package:testappfirst/untils/colors.dart';
import 'package:testappfirst/widgets/app_icon.dart';
import 'package:testappfirst/widgets/big_taxt.dart';

import '../../routes/route_helper.dart';
import '../../untils/dimensions.dart';
import '../../widgets/account_widget.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title:  Center(
          child: BigText(
            text: "Профіль", size: 24, color: Colors.white,
          ),
        ),
        ),

      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),
        child: Column(

          children: [
            //іконка профілю
            AppIcon(
              icon: Icons.person,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: Dimensions.height45+Dimensions.height30,
              size: Dimensions.height15*10,
            ),
            SizedBox(height: Dimensions.height30,),
            
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //ім'я
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.person,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5,
                      ),
                      bigText: BigText(text: "Vasyl"),
                    ),
                    SizedBox(height: Dimensions.height20,),
                    //телефон
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.phone,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5,
                      ),
                      bigText: BigText(text: "0687275137"),
                    ),
                    SizedBox(height: Dimensions.height20,),
                    //пошта
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.email,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5,
                      ),
                      bigText: BigText(text: "test@gmail.com"),
                    ),
                    SizedBox(height: Dimensions.height20,),
                    //адреса
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.location_on,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5,
                      ),
                      bigText: BigText(text: "Введіть свою адресу"),
                    ),
                    SizedBox(height: Dimensions.height20,),
                    //повідомлення
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.message_outlined,
                        backgroundColor: Colors.redAccent,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5,
                      ),
                      bigText: BigText(text: "Повідомлення"),
                    ),
                    SizedBox(height: Dimensions.height20,),
                    //вихід
                    GestureDetector(
                      onTap: (){
                       if(Get.find<AuthController>().userLoggedIn()){
                         Get.find<AuthController>().clearSharedData();
                         Get.find<CartController>().clear();
                         Get.find<CartController>().clearCartHistory();
                         Get.offNamed(RouteHelper.getSignUpPage());
                       }


                      },
                      child: AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.logout,
                          backgroundColor: Colors.redAccent,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10*5/2,
                          size: Dimensions.height10*5,
                        ),
                        bigText: BigText(text: "Вихід"),
                      ),
                    ),
                    SizedBox(height: Dimensions.height20,),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
