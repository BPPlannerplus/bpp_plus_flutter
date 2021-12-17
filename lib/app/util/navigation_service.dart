import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigatorProvider =
    Provider<NavigationService>((ref) => NavigationService());

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Future<dynamic> navigateTo({
    required String routeName,
    Object? argument,
  }) {
    return navigatorKey.currentState!.pushNamed(
      routeName,
      arguments: argument,
    );
  }

  Future<dynamic> navigateToRemove({
    required String routeName,
    Object? argument,
  }) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: argument,
    );
  }

  dynamic pop({Object? result}) {
    return navigatorKey.currentState!.pop(result);
  }

  Future<void> openDialog(Widget dialog) async {
    await showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) => dialog,
    );
  }
}
