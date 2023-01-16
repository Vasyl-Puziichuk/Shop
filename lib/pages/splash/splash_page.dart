import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:testappfirst/routes/route_helper.dart';
import 'package:testappfirst/untils/dimensions.dart';

import '../../controllers/popular_product_contr.dart';
import '../../controllers/recommended_product_contr.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  
  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResource() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  void initState(){

    super.initState();
    _loadResource();
    controller =AnimationController(
        vsync: this, 
        duration: const Duration(seconds: 2))..forward();

    animation=CurvedAnimation(
        parent: controller, 
        curve: Curves.linear);
    Timer(
      const Duration(seconds: 3),
        ()=>Get.offNamed(RouteHelper.getInitial())
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(
              child:Image.asset("assets/image/logo3.png",
                width: Dimensions.splashImg,) ,
            ),
          ),
          Center(
            child:Image.asset("assets/image/text.png",
              width: Dimensions.splashImg,) ,
          )
        ],
      ),
    );
  }
}
