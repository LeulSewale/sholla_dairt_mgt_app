import 'dart:ui';

import 'package:flutter/material.dart';

class AppConstants {
  static const String appName = 'Dairy Management';
  static const String baseUrl = 'https://api.dairymanagement.com';

  // API Endpoints
  static const String loginEndpoint = '/auth/login';
  static const String dashboardEndpoint = '/dashboard';
  static const String productsEndpoint = '/products';
  static const String messagesEndpoint = '/messages';
  static const String depositsEndpoint = '/deposits';

  // Local Storage Keys
  static const String userTokenKey = 'user_token';
  static const String userDataKey = 'user_data';

  // Error Messages
  static const String networkError = 'Network error occurred';
  static const String serverError = 'Server error occurred';
  static const String unknownError = 'Unknown error occurred';
}

class AppColors {
  static const primery = Color(0xFF075698);
  static const bgprimery = Color(0xFFeff1f3);
  static const yellowprimery = Color(0xFFff9100);
  static const greenprimery = Color(0xFF13b665);
  static const redprimery = Color(0xFFff0000);



  

  static const secondary = Colors.white;
}
