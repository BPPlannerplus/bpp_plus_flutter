import 'package:bpp_riverpod/app/model/mypage/mypage_data.dart';
import 'package:bpp_riverpod/app/routes/custom_arg/profile_arg.dart';
import 'package:bpp_riverpod/app/routes/custom_arg/report_arg.dart';
import 'package:bpp_riverpod/app/routes/custom_arg/review_arg.dart';
import 'package:bpp_riverpod/app/ui/detail/detail_page.dart';
import 'package:bpp_riverpod/app/ui/detail/detail_portfolio_full_screen.dart';
import 'package:bpp_riverpod/app/ui/detail/detail_profile_page.dart';
import 'package:bpp_riverpod/app/ui/login/login_page.dart';
import 'package:bpp_riverpod/app/ui/main_page.dart';
import 'package:bpp_riverpod/app/ui/onboarding/onboarding_page.dart';
import 'package:bpp_riverpod/app/ui/report/report_page.dart';
import 'package:bpp_riverpod/app/ui/review/my_review_page.dart';
import 'package:bpp_riverpod/app/ui/review/review_edit_page.dart';
import 'package:bpp_riverpod/app/ui/review/review_write_page.dart';
import 'package:bpp_riverpod/app/ui/setting/setting_page.dart';
import 'package:bpp_riverpod/app/ui/setting/withdrawal_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const mainPage = '/main';
  static const detailPage = '/detail';
  static const reportPage = '/report';
  static const detailProfilePage = '/detailProfile';
  static const detailPortfolioPage = '/detailPortfolio';
  static const loginPage = '/login';
  static const settingPage = '/setting';
  static const withdrawalPage = '/withdrawal';
  static const reviewWritePage = '/reviewWrite';
  static const reviewEditPage = '/reviewEdit';
  static const myReviewPage = '/myReview';
  static const licensePage = '/license';
  static const onboardingPage = '/onboarding';
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
      case AppRoutes.onboardingPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const OnBoardingPage(),
          settings: settings,
        );
      case AppRoutes.mainPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const MainPage(),
          settings: settings,
        );
      case AppRoutes.detailPage:
        final int arg = settings.arguments;
        return MaterialPageRoute<dynamic>(
          builder: (_) => DetailPage(shopId: arg),
          settings: settings,
        );
      case AppRoutes.detailProfilePage:
        final ProfileArg args = settings.arguments;
        return MaterialPageRoute<dynamic>(
          builder: (_) =>
              DetailProfilePage(profiles: args.profiles, index: args.index),
          settings: settings,
        );
      case AppRoutes.detailPortfolioPage:
        final String args = settings.arguments;
        return MaterialPageRoute<dynamic>(
          builder: (_) => DetailPortfolioFullScreen(
            profile: args,
          ),
          settings: settings,
        );
      case AppRoutes.reportPage:
        final ReportArg args = settings.arguments;
        return MaterialPageRoute<dynamic>(
          builder: (_) => ReportPage(
            reviewId: args.reviewId,
            onReport: args.onReport,
          ),
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
      case AppRoutes.reviewWritePage:
        final MypageData arg = settings.arguments;
        return MaterialPageRoute<dynamic>(
          builder: (_) => ReviewWritePage(mypageData: arg),
          settings: settings,
        );
      case AppRoutes.reviewEditPage:
        final ReviewEditArg arg = settings.arguments;
        return MaterialPageRoute<dynamic>(
          builder: (_) => ReviewEditPage(
            mypageData: arg.mypageData,
            score: arg.score,
            reviewId: arg.reviewId,
          ),
          settings: settings,
        );
      case AppRoutes.myReviewPage:
        final MypageData arg = settings.arguments;
        return MaterialPageRoute<dynamic>(
          builder: (_) => MyReviewPage(mypageData: arg),
          settings: settings,
        );
      case AppRoutes.licensePage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const LicensePage(
            applicationName: '바프플래너',
            applicationVersion: '0.0.1',
          ),
          settings: settings,
        );
    }
  }
}
