import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/injection_container.dart';
import 'presentation/pages/splash/splash_page.dart';
import 'presentation/theme/app_theme.dart';
import 'presentation/bloc/auth/auth_bloc.dart';
import 'presentation/bloc/dashboard/dashboard_bloc.dart';
import 'presentation/bloc/products/products_bloc.dart';
import 'presentation/bloc/communication/communication_bloc.dart';
import 'presentation/bloc/deposit/deposit_bloc.dart';
import 'package:dairy_management/presentation/pages/main/main_page.dart';
import 'package:dairy_management/presentation/pages/products/products_page.dart';
import 'package:dairy_management/presentation/pages/communication/communication_page.dart';
import 'package:dairy_management/presentation/pages/my%20order/my_orders.dart';
import 'package:dairy_management/presentation/pages/order_confirmation/order_confirmation_page.dart';
import 'package:dairy_management/presentation/pages/deposit/deposit_page.dart';
import 'package:dairy_management/presentation/pages/notification/notification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<AuthBloc>()),
        BlocProvider(create: (_) => sl<DashboardBloc>()),
        BlocProvider(create: (_) => sl<ProductsBloc>()),
        BlocProvider(create: (_) => sl<CommunicationBloc>()),
        BlocProvider(create: (_) => sl<DepositBloc>()),
      ],
      child: MaterialApp(
        title: 'Dairy Management',
        theme: AppTheme.lightTheme,
        home: const SplashPage(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/main',
        routes: {
          '/main': (context) => const MainPage(),
          '/products': (context) => const ProductsPage(),
          '/communication': (context) => const CommunicationPage(),
          '/my-orders': (context) => const MyOrders(),
          '/order-confirmation': (context) =>
              const OrderConfirmationPage(isAccepted: true),
          '/deposit': (context) => const DepositPage(),
          '/notifications': (context) => NotificationPage(),
        },
      ),
    );
  }
}
