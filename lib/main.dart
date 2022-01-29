import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'modules/home/home_binding.dart';
import 'modules/home/home_page.dart';

void main() async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // initialRoute: Routes.SPLASH,
        // theme: appThemeData,
        defaultTransition: Transition.fade,
        initialBinding: HomePageBinding(),
        // getPages: AppPages.pages,
        // home: SplashPage(),
        home: const HomePage(),
    )
  );
}