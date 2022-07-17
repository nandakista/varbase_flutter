import 'package:get/get.dart';
import 'package:varcore_flutter_base/ui/view/auth/splash/splash_view.dart';

final splashRoute = [
  GetPage(
    name: SplashView.route,
    page: () => const SplashView(),
    participatesInRootNavigator: true,
  ),
];
