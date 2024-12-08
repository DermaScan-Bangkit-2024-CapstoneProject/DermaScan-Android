import 'package:dermascan/app/middleware/page/auth_middleware.dart';
import 'package:get/get.dart';

import '../modules/article_detail/bindings/article_detail_binding.dart';
import '../modules/article_detail/views/article_detail_view.dart';
import '../modules/articles/bindings/articles_binding.dart';
import '../modules/articles/views/articles_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/preview/bindings/preview_binding.dart';
import '../modules/preview/views/preview_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/result/bindings/result_binding.dart';
import '../modules/result/views/result_view.dart';
import '../modules/scan/bindings/scan_binding.dart';
import '../modules/scan/views/scan_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.SCAN,
      page: () => ScanView(),
      binding: ScanBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    // GetPage(
    //   name: _Paths.PLACEHOLDER,
    //   page: () => const PlaceholderView(),
    //   binding: PlaceholderBinding(),
    // ),
    GetPage(
      name: _Paths.RESULT,
      page: () => ResultView(),
      binding: ResultBinding(),
    ),
    GetPage(
      name: _Paths.PREVIEW,
      page: () => const PreviewView(),
      binding: PreviewBinding(),
    ),
    GetPage(
      name: _Paths.ARTICLES,
      page: () => ArticlesView(),
      binding: ArticlesBinding(),
    ),
    GetPage(
      name: _Paths.ARTICLE_DETAIL,
      page: () => ArticleDetailView(),
      binding: ArticleDetailBinding(),
    ),
  ];
}
