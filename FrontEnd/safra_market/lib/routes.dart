import 'package:flutter/material.dart';
import 'package:safra_market/screens/home/home_screen.dart';
import 'package:safra_market/screens/login/login_screen.dart';
import 'package:safra_market/screens/cart/cart_screen.dart';
import 'package:safra_market/screens/cart/success_purchase.dart';
import 'package:safra_market/screens/cart/failure_purchase.dart';

final routes = {
  '/login': (BuildContext context) => new LoginScreen(),
  '/home': (BuildContext context) => new HomeScreen(),
  '/cart': (BuildContext context) => new CartScreen(),
  '/cart/success_purchase': (BuildContext context) => new SucessPurchaseScreen(),
  '/cart/failure_purchase': (BuildContext context) => new FailurePurchaseScreen(),
  '/': (BuildContext context) => new LoginScreen(),
};
