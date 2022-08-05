import 'package:get/get.dart';
import '../ui/views/home_page.dart';
import '../ui/views/splash_screen.dart';


const String splash = '/splash-screen';
const String homescreen = '/home-screen';


List<GetPage> getPages = [
  GetPage(
      name: splash,
      page: () => SplashScreen()
  ),
  GetPage(
      name: homescreen,
      page: () => HomePage()
  ),




];