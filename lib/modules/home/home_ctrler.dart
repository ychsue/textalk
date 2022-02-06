import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:textalk/IO/chromecast/cast_repository.dart';

class HomeController extends GetxController {
  final fontSize = 24.0.obs;
  final List<Worker> _workers =[];
  static const String fontSizeKey = "fontSize";
  
  final chromecastRepository = Get.find<ChromeCastRepository>();
  final isChromcastAvailable = false.obs;
  final hasSession = false.obs;

  final chromeTimes = 5.0.obs;
  static const String chromeTimesKey = "chromeTimes";

  void setChromeFontSize(double f, double c){
    chromecastRepository.sendMessage(
    jsonEncode({"fontSize":f*c}));
  }

  final textValue = "".obs;

  @override
  void onInit() {
    super.onInit();
    // #region Read fontSize & chromeTimes
    final box = GetStorage();
    final fontSizeBuf = box.read<double>(fontSizeKey);
    if(fontSizeBuf!=null) fontSize.value =fontSizeBuf;
    // Save fontSize when it is changed
    _workers.add(
      debounce(fontSize, 
        (double v){
          setChromeFontSize(v, chromeTimes.value);
          final box = GetStorage();
          box.write(fontSizeKey, v);
        })
    );

    final chTimesBuf = box.read<double>(chromeTimesKey);
    if(chTimesBuf!=null) chromeTimes.value =chTimesBuf;
    // Save fontSize when it is changed
    _workers.add(
      debounce(chromeTimes, 
        (double v){
          setChromeFontSize(fontSize.value,v);          
          final box = GetStorage();
          box.write(chromeTimesKey, v);
        })
    );
    // #endregion Read fontSize & chromeTimes

    // For Chromecast
    isChromcastAvailable.value = chromecastRepository.isAvailable;
    chromecastRepository.onHasSession = (v){ 
        hasSession.value =v;
      };

    // chromecastRepository.onAppendMessage = (data)=>print("Flutter: "+data);

    // Send message to chromecast
    _workers.add(
      debounce(textValue, 
        (String v){
          if (hasSession.value==true) {
            chromecastRepository.sendMessage(v);
          }
        }, time: const Duration(milliseconds: 1))
    );
  }

  @override
  void dispose() {
    for (var element in _workers) {element.dispose();}
    super.dispose();
  }
}