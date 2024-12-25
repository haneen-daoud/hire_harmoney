import 'package:flutter/material.dart';
import 'package:hire_harmony/utils/app_colors.dart';
import 'package:hire_harmony/views/pages/cus_home_page.dart';
import 'package:hire_harmony/views/pages/employeePages/emp_home_page.dart';
import 'package:hire_harmony/views/pages/favorites_page.dart';
import 'package:hire_harmony/views/pages/messages_page.dart';
import 'package:hire_harmony/views/pages/order_page.dart';
import 'package:hire_harmony/views/pages/profile_page.dart';
class CustomButtomNavbar extends StatefulWidget {
  const CustomButtomNavbar({super.key});

  @override
  State<CustomButtomNavbar> createState() => _CustomButtomNavbarState();
}

class _CustomButtomNavbarState extends State<CustomButtomNavbar> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      /*
      drawer: const Drawer(
        child: Center(
           child: Text('inside the drawer haneen daoud  '),

        ),
      ),

      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.notifications))
        ],
        title:  Column(

          children: [
           Text('Current Location',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: AppColors.grey
            ),
            ),
            Row(
              mainAxisAlignment:MainAxisAlignment.center ,
              children: [
               Icon(Icons.location_city,color: AppColors.orange   ,),
                Text(
                  'Qalqiliya , palestine',
                  style: Theme.of(context).textTheme.titleLarge,
                  ),
              ],
            ),
          ],
        ),
      ),
*/
      bottomNavigationBar: size.width>=800
      ? null
      :NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor:AppColors.orange,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.favorite),
            icon: Icon(Icons.favorite_border),
            label: 'Faavorite',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.list),
            icon: Icon(Icons.list_alt_outlined),
            label: 'My Order',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.message),
            icon: Icon(Icons.message_outlined),
            label: 'Messages',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
      ),
      body: <Widget>[
      
        //CusHomePage(),
        EmpHomePage(),
        const FavoritesPage(),
        const OrderPage(),
        const MessagesPage(),
        const ProfilePage(),
      ][currentPageIndex],
    );
  }
}
