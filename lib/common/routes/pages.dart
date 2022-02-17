import 'package:flutter/material.dart';
import 'package:flutter_ducafecat_news_getx/common/middlewares/middlewares.dart';
import 'package:flutter_ducafecat_news_getx/pages/application/index.dart';
import 'package:flutter_ducafecat_news_getx/pages/category/index.dart';
import 'package:flutter_ducafecat_news_getx/pages/frame/sign_in/index.dart';
import 'package:flutter_ducafecat_news_getx/pages/frame/sign_up/index.dart';
import 'package:flutter_ducafecat_news_getx/pages/frame/welcome/index.dart';
import 'package:get/get.dart';

import 'routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static final List<GetPage> routes = [
    // 免登陆
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => WelcomePage(),
      binding: WelcomeBinding(),
      middlewares: [
        RouteWelcomeMiddleware(priority: 1),
      ],
    ),
    GetPage(
      name: AppRoutes.SIGN_IN,
      page: () => SignInPage(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: AppRoutes.SIGN_UP,
      page: () => SignUpPage(),
      binding: SignUpBinding(),
    ),

    // 需要登录
    GetPage(
      name: AppRoutes.Application,
      page: () => ApplicationPage(),
      binding: ApplicationBinding(),
      middlewares: [
        RouteAuthMiddleware(priority: 1),
      ],
    ),

    // 分类列表
    GetPage(
      name: AppRoutes.Category,
      page: () => CategoryPage(),
      binding: CategoryBinding(),
    ),
  ];

  // static final unknownRoute = GetPage(
  //   name: AppRoutes.NotFound,
  //   page: () => NotfoundView(),
  // );

}
