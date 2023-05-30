import 'package:get/get.dart';
import 'Api/HomeService.dart';

class Home_Controller extends GetxController with GetSingleTickerProviderStateMixin {
  HomeService homeService=HomeService();
}