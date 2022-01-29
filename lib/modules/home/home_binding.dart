import 'package:get/get.dart';
import 'home_ctrler.dart';

class HomePageBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<HomeController>(() => HomeController());
  }
}