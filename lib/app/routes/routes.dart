import 'package:bpp_riverpod/app/model/shop_detail_data.dart';
import 'package:bpp_riverpod/app/ui/detail/detail_page.dart';
import 'package:bpp_riverpod/app/ui/detail/detail_portfolio_full_screen.dart';
import 'package:bpp_riverpod/app/ui/detail/detail_profile_page.dart';
import 'package:bpp_riverpod/app/ui/login/login_page.dart';
import 'package:bpp_riverpod/app/ui/main_page.dart';
import 'package:bpp_riverpod/app/ui/report/report_page.dart';
import 'package:bpp_riverpod/app/ui/setting/setting_page.dart';
import 'package:bpp_riverpod/app/ui/setting/withdrawal_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const mainPage = '/';
  static const detailPage = '/detail';
  static const reportPage = '/report';
  static const detailProfilePage = '/detailProfile';
  static const detailPortfolioPage = '/detailPortfolio';
  static const loginPage = '/login';
  static const settingPage = '/setting';
  static const withdrawalPage = '/withdrawalPage';
}

class AppRouter {
  static Route<dynamic>? onGenerateRoute(
    settings,
  ) {
    switch (settings.name) {
      case AppRoutes.loginPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const LoginPage(),
          settings: settings,
        );
      case AppRoutes.mainPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const MainPage(),
          settings: settings,
        );
      case AppRoutes.detailPage:
        final DetailIndex args = settings.arguments;
        return MaterialPageRoute<dynamic>(
          builder: (_) => DetailPage(
            index: args.index,
            shopId: args.shopId,
          ),
          settings: settings,
        );
      case AppRoutes.detailProfilePage:
        final ProfileData args = settings.arguments;
        return MaterialPageRoute<dynamic>(
          builder: (_) =>
              DetailProfilePage(profiles: args.profiles, index: args.index),
          settings: settings,
        );
      case AppRoutes.detailPortfolioPage:
        final Portfolio args = settings.arguments;
        return MaterialPageRoute<dynamic>(
          builder: (_) => DetailPortfolioFullScreen(
            profile: args.profile,
          ),
          settings: settings,
        );
      case AppRoutes.reportPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const ReportPage(),
          settings: settings,
        );
      case AppRoutes.settingPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const SettingPage(),
          settings: settings,
        );
      case AppRoutes.withdrawalPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const WithdrawalPage(),
          settings: settings,
        );
    }
  }
}

class ProfileData {
  final List<String> profiles;
  final int index;

  ProfileData({
    required this.profiles,
    required this.index,
  });
}

class Portfolio {
  final String profile;

  Portfolio({
    required this.profile,
  });
}
