import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final fontSize = 24.0.obs;
  late Worker _fontSizeWorker;
  static const String fontSizeKey = "fontSize";

  @override
  void onInit() {
    super.onInit();
    // Read fontSize
    final box = GetStorage();
    final fontSizeBuf = box.read<double>(fontSizeKey);
    if(fontSizeBuf!=null) fontSize.value =fontSizeBuf;

    // Save fontSize when it is changed
    _fontSizeWorker = debounce(fontSize, 
    (v){
      final box = GetStorage();
      box.write(fontSizeKey, v);
    });
  }

  @override
  void dispose() {
    _fontSizeWorker.dispose();
    super.dispose();
  }
}