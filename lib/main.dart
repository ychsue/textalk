import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:textalk/IO/chromecast/cast_provider_web.dart';
import 'package:textalk/IO/chromecast/cast_repository.dart';

import 'modules/home/home_binding.dart';
import 'modules/home/home_page.dart';

void main() async {
  await GetStorage.init();
  Get.put(ChromeCastRepository(ChromeCastAPI(),),);
  runApp(
    GetMaterialApp(
      title: "文字代替說話",
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