import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigatorProvider =
    Provider<NavigationService>((ref) => NavigationService());

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Future<void> navigateTo({
    required String routeName,
    Object? argument,
  }) {
    return navigatorKey.currentState!.pushNamed(
      routeName,
      arguments: argument,
    );
  }

  Future<void> navigateToRemove({
    required String routeName,
    Object? argument,
  }) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: argument,
    );
  }

  void pop() {
    return navigatorKey.currentState!.pop();
  }
}
