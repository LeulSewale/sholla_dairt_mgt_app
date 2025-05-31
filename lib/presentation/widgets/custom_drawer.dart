import 'package:dairy_management/core/constants/app_constants.dart';
import 'package:dairy_management/presentation/pages/auth/login_page.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.black,
                      child: Icon(Icons.menu, size: 34, color: Colors.white),
                    ),
                  ),
                ),
                _buildDrawerItem(
                  icon: Icons.home,
                  title: 'Home',
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.inventory_2,
                  title: 'Products',
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/products');
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.message,
                  title: 'Communication',
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/communication');
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.shopping_bag,
                  title: 'My Orders',
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/my-orders');
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.history,
                  title: 'My History',
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/order-confirmation');
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.account_balance,
                  title: 'Deposit Management',
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/deposit');
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.notifications,
                  title: 'Notifications',
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/notifications');
                  },
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: ListTile(
              leading: const Icon(Icons.logout, color: Colors.red, size: 26),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    return ListTile(
      leading: Icon(icon, color: isLogout ? Colors.red : AppColors.primery),
      title: Text(
        title,
        style: TextStyle(
          color: isLogout ? Colors.red : Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
    );
  }
}
