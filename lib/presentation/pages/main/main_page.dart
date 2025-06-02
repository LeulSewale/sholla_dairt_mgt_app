import 'package:dairy_management/core/constants/app_constants.dart';
import 'package:dairy_management/presentation/pages/notification/notification.dart';
import 'package:flutter/material.dart';
import '../dashboard/dashboard_page.dart';
import '../products/products_page.dart';
import '../communication/communication_page.dart';
import '../deposit/deposit_page.dart';
import '../../widgets/custom_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _pages = [
    const DashboardPage(),
    const ProductsPage(),
    const CommunicationPage(),
    const DepositPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgprimery,
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: AppColors.bgprimery,
          leading: 
               Padding(
                 padding: const EdgeInsets.only(left: 20.0),
                 child: CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.white,
                      
                    
                             child:IconButton(
                             icon: const Icon(Icons.menu,color: AppColors.primery),
                             onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                           ),),
               ),
          title: Text(_getTitle()),
          actions: [
               Padding(
                 padding: const EdgeInsets.only(right: 20.0),
                 child: CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.white,
                      
                    
                             child: IconButton(
                               icon: const Icon(Icons.notifications, color: AppColors.primery),
                               onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotificationPage()),
                  );
                               },
                             ),
                               ),
               )
          ],
        ),
        drawer: const CustomDrawer(),
        body: DashboardPage()
        //  _pages[_currentIndex],
        // bottomNavigationBar: BottomNavigationBar(
        //   type: BottomNavigationBarType.fixed,
        //   currentIndex: _currentIndex,
        //   onTap: (index) => setState(() => _currentIndex = index),
        //   items: const [
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.dashboard),
        //       label: 'Dashboard',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.inventory),
        //       label: 'Products',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.message),
        //       label: 'Communication',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.account_balance),
        //       label: 'Deposit',
        //     ),
        //   ],
        // ),
        );
  }

  String _getTitle() {
    switch (_currentIndex) {
      case 0:
        return 'Dashboard';
      case 1:
        return 'Product Catalogue';
      case 2:
        return 'Communication';
      case 3:
        return 'Credit Management';
      default:
        return 'Dairy Management';
    }
  }
}
