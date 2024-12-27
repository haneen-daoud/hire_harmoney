import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hire_harmony/utils/app_colors.dart';
import 'package:hire_harmony/views/pages/employeePages/advertisement.dart';
import 'package:hire_harmony/views/pages/employeePages/emp_booking_page.dart';
import 'package:hire_harmony/views/pages/employeePages/help_support_page.dart';
import 'package:hire_harmony/views/pages/employeePages/tiket_page.dart';
import 'package:hire_harmony/views/pages/notification_page.dart';
import 'package:hire_harmony/views/pages/search_and_filter.dart';
import 'package:hire_harmony/views/widgets/employee_widget/drawer_widget.dart';
import 'package:hire_harmony/views/widgets/employee_widget/photo_tap_view.dart';
import 'package:hire_harmony/views/widgets/employee_widget/prev_work.dart';
import 'package:hire_harmony/views/widgets/employee_widget/reviews_tap_view.dart';

class EmpHomePage extends StatelessWidget {
  // GlobalKey للتحكم في Scaffold
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey, // تعيين المفتاح
        backgroundColor: Colors.white,
        drawer: const ProfileDrawer(
          name: "Haneen Daoud",
          email: "haneendaoud2023@gmail.com",
        ),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child: Container(
            color: AppColors.orange,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(Icons.account_circle_outlined,
                              color: AppColors.white, size: 25),
                          onPressed: () {
                            // فتح القائمة الجانبية
                            _scaffoldKey.currentState?.openDrawer();
                          },
                        ),
                        Text(
                          'Good Afternoon, Haneen',
                          style: GoogleFonts.montserratAlternates(
                            textStyle: TextStyle(
                              fontSize: 18,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      child: Icon(
                        Icons.notifications_active_outlined,
                        color: AppColors.white,
                        size: 25,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotificationPage()),
                        );
                      },
                    )
                  ],
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for "Indoor Cleaning"',
                      hintStyle: GoogleFonts.montserratAlternates(
                        textStyle: TextStyle(
                          fontSize: 16,
                          color: AppColors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      border: InputBorder.none,
                      prefixIcon: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchAndFilter()));
                        },
                        child: Icon(
                          Icons.search,
                          color: AppColors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Overview',
                  style: GoogleFonts.montserratAlternates(
                    textStyle: TextStyle(
                      fontSize: 15,
                      color: AppColors.navy,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 10),
                GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    OverviewCard(
                        title: 'Order', count: '32', icon: Icons.shopping_bag),
                    OverviewCard(
                      title: 'Booking',
                      count: '100',
                      icon: Icons.book_online,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookingScreen(),
                          ),
                        );
                      },
                    ),
                    OverviewCard(
                      title: 'Post Ad',
                      count: '32',
                      icon: Icons.post_add,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdvertisementScreen(),
                          ),
                        );
                      },
                    ),
                    OverviewCard(
                      title: 'Project Task',
                      count: '24',
                      icon: Icons.task,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HelpSupportPage(),
                          ),
                        );
                      },
                    ),
                    OverviewCard(
                      title: 'Support Credits',
                      count: '24',
                      icon: Icons.support,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TicketsPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const PrevWork(),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OverviewCard extends StatelessWidget {
  final String title;
  final String count;
  final IconData icon;
  final VoidCallback? onTap;

  OverviewCard({
    required this.title,
    required this.count,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.orange, size: 30),
            const SizedBox(height: 5),
            Text(title, style: const TextStyle(fontSize: 14)),
            Text(count, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

class WorkPhotoCard extends StatelessWidget {
  final String image;
  final String title;

  WorkPhotoCard({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade200,
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(image, height: 100, fit: BoxFit.cover),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
