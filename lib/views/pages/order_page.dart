import 'package:flutter/material.dart';
import 'package:hire_harmony/utils/app_colors.dart';
import 'package:hire_harmony/views/widgets/order_history_tap_view.dart';
import 'package:hire_harmony/views/widgets/order_penging_tap_view.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController( // توفير التحكم في التاب لجميع الصفحة
      length: 2, // عدد التابات
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Orders',
            style: TextStyle(color: AppColors.navy),
          ),
          
          
          bottom: TabBar(
            
            dividerColor: Colors.transparent,
            labelColor: AppColors.orange,
            unselectedLabelColor: AppColors.grey2,
            indicatorColor: AppColors.orange,
            tabs: const [
              Tab(text: 'Pending'), 
              Tab(text: 'History'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            
            OrderPengingTapView(), // محتوى التاب الأول
            OrderHistoryTapView(), 
            // محتوى التاب الثاني
           


          ],
        ),
      ),
    );
  }
}
