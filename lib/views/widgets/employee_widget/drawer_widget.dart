import 'package:flutter/material.dart';
import 'package:hire_harmony/utils/app_colors.dart';
import 'package:hire_harmony/views/pages/employeePages/about_app.dart';
import 'package:hire_harmony/views/pages/profile_page.dart';
import 'package:hire_harmony/views/widgets/employee_widget/add_tiket_widget.dart';

class ProfileDrawer extends StatelessWidget {
  final String name;
  final String email;

  const ProfileDrawer({required this.name, required this.email, super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.orange, // لون الخلفية
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.grey[800],
              child: Text(
                name.isNotEmpty ? name[0].toUpperCase() : '?',
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            accountName: Text(
              name.isNotEmpty ? name : "No Name",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(
              email.isNotEmpty ? email : "No Email",
              style: const TextStyle(fontSize: 14),
            ),
          ),
          _buildMenuItem(Icons.lock, "Change Password", () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              ),
            );
            // Action for change password
          }),
          _buildMenuItem(Icons.favorite, "Favorite", () {
            // Action for favorite
          }),
          _buildMenuItem(Icons.phone, "Contact Us", () {
            // Action for contact us
             Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  AboutAppPage(),
              ),
            );
          }),
           _buildMenuItem(Icons.lock, "Send Tiket", () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  const AddTicketPage(),
              ),
            );
            // Action for change password
          }),
          _buildMenuItem(Icons.logout, "Logout", () {
            // Action for logout
          }),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: AppColors.navy),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      onTap: onTap,
    );
  }
}
