import 'package:get/get.dart';
import 'package:my_diary/ui/auth/login_signup_page.dart';
import 'package:my_diary/ui/views/item_details.dart';
import '../ui/views/home_page.dart';
import '../ui/views/splash_screen.dart';


const String splash = '/splash-screen';
const String homescreen = '/home-screen';
const String loginsignup = '/login-screen';
const String itemdetals = '/item-details';


List<GetPage> getPages = [
  GetPage(
      name: splash,
      page: () => SplashScreen()
  ),
  GetPage(
      name: homescreen,
      page: () => HomePage()
  ),
  GetPage(
      name: loginsignup,
      page: () => LoginSignup()
  ),





];