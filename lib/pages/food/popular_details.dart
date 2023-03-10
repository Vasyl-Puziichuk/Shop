import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testappfirst/controllers/cart_controller.dart';
import 'package:testappfirst/controllers/popular_product_contr.dart';
import 'package:testappfirst/home/main_page1.dart';
import 'package:testappfirst/untils/app_constants.dart';
import 'package:testappfirst/untils/dimensions.dart';
import 'package:testappfirst/widgets/app_icon.dart';
import 'package:testappfirst/widgets/app_column.dart';
import 'package:get/get.dart';

import '../../routes/route_helper.dart';
import '../../untils/colors.dart';
import '../../widgets/big_taxt.dart';
import '../../widgets/icon&text_widget.dart';
import '../../widgets/small_text.dart';
import '../../widgets/exandable_text_widgets.dart';
import '../cart/cart_page.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  final String page;
  const PopularFoodDetail({Key? key,
    required this.pageId, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product=Get.find<PopularProductController>().popularProductList[pageId];
    //print("page is id "+pageId.toString());
    //print("product name is "+product.name.toString());
    Get.find<PopularProductController>().initProduct(product,Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //Фонова картинка
          Positioned(
            left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!
                    ),
                  )
                ),
              )),
          //Іконки назад і кошик
          Positioned(
            top: Dimensions.height55,
            left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap:(){
                        if(page=="cartpage"){
                          Get.toNamed(RouteHelper.getCartPage());
                        }
                        else{
                          Get.toNamed(RouteHelper.getInitial());
                        }
                      },
                      child:
                        AppIcon(icon: Icons.arrow_back)
                  ),
                 GetBuilder<PopularProductController>(builder: (controller){
                   return GestureDetector(
                     onTap: (){
                       if(controller.totalItems>=1) {
                         Get.toNamed(RouteHelper.getCartPage());
                       }
                     },
                     child: Stack(
                       children: [
                         AppIcon(icon: Icons.shopping_cart_checkout_outlined),
                         controller.totalItems>=1?
                            Positioned(
                              right:0, top:0,

                                child: AppIcon(icon: Icons.circle, size: 20,
                                  iconColor: Colors.transparent,
                                  backgroundColor: AppColors.mainColor,),

                            ):
                                Container(),

                         Get.find<PopularProductController>().totalItems>=1?
                         Positioned(
                           right:4, top:3,
                           child: BigText(text: Get.find<PopularProductController>().totalItems.toString(),
                           size:12, color: Colors.white,
                           ),
                         ):
                         Container()
                       ],
                     ),
                   );
                 })
                ],
              )),
          //Блок з описом
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImgSize-20,
              child: Container(

                padding: EdgeInsets.only(left: Dimensions.width20,
                    right:Dimensions.width20, top: Dimensions.height20 ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: product.name!),
                    SizedBox(height: Dimensions.height20,),
                    BigText(text: "Описання"),
                    SizedBox(height: Dimensions.height20,),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableTextWidget(
                            text:product.description!),
                      ),
                    )
                  ],
                ),
              )),

          
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (popularProduct){
        return Container(
          height: Dimensions.bottomHeightBar,
          padding: EdgeInsets.only(top:Dimensions.height30,
              bottom:Dimensions.height30, left: Dimensions.width20,
              right: Dimensions.width20 ),
          decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20*2),
                topRight: Radius.circular(Dimensions.radius20*2),
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: Dimensions.height20,
                    bottom: Dimensions.height20, left:Dimensions.width20,
                    right: Dimensions.height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: (){
                          popularProduct.setQuantity(false);
                        },
                        child: Icon(Icons.remove, color: AppColors.signColor,)),
                    SizedBox(width: Dimensions.width10/2,),
                    BigText(text: popularProduct.inCartItems.toString()),
                    SizedBox(width: Dimensions.width10/2,),
                    GestureDetector(
                        onTap: (){
                          popularProduct.setQuantity(true);
                        },
                        child: Icon(Icons.add, color: AppColors.signColor,)),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  popularProduct.addItem(product);
                },
                child: Container(
                  padding: EdgeInsets.only(top: Dimensions.height20,
                      bottom: Dimensions.height20, left:Dimensions.width20,
                      right: Dimensions.height20),
                      child: BigText(text: "\₴ ${product.price!} | До кошика", color: Colors.white,),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor
                  ),
                ),
              )
            ],
          ),
        );
      },),
    );
  }
}
