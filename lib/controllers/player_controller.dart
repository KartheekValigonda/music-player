import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class PlayerController extends GetxController {
  final audioQuerry= OnAudioQuery();

  @override
  void onInit() {
    super.onInit();
    checkPermission();
  }

  checkPermission() async{
    var perm= await Permission.storage.request();
    if(perm.isGranted){
      return audioQuerry.querySongs(
        ignoreCase: true,
        orderType: OrderType.ASC_OR_SMALLER,
        sortType: null,
        uriType: UriType.EXTERNAL,
      );
    }else{
      checkPermission();
    }
  }
}