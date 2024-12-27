import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hire_harmony/utils/app_colors.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    // قائمة المراجعات
    final List<Map<String, String>> reviews = [
      {
        'image': 'assets/images/teacher.jpg',
        'name': 'Miles Esther',
        'date': '1 Feb, 2020',
        'rating': '4.5',
        'review':
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.',
      },
      {
        'image': 'assets/images/teacher.jpg',
        'name': 'Henry Arthur',
        'date': '21 Sep, 2020',
        'rating': '4.0',
        'review':
            'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet consectetur adipisci velit.',
      },
      {
        'image': 'assets/images/teacher.jpg',
        'name': 'Alice Johnson',
        'date': '15 Mar, 2021',
        'rating': '5.0',
        'review': '',
      },
      {
        'image': 'assets/images/teacher.jpg',
        'name': 'Bob Smith',
        'date': '10 Jun, 2021',
        'rating': '4.0',
        'review': '',
      },
      {
        'image': 'assets/images/teacher.jpg',
        'name': 'Charlie Brown',
        'date': '5 Jul, 2021',
        'rating': '4.8',
        'review':
            'Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam.',
      },
      {
        'image': 'assets/images/teacher.jpg',
        'name': 'Diana Prince',
        'date': '20 Aug, 2021',
        'rating': '4.7',
        'review':
            'Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur.',
      },
      {
        'image': 'assets/images/teacher.jpg',
        'name': 'Ethan Hunt',
        'date': '30 Sep, 2021',
        'rating': '4.9',
        'review':
            'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Customer Reviews',
          style: GoogleFonts.montserratAlternates(color: AppColors.white),
        ),
        centerTitle: true,
        backgroundColor: AppColors.orange,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.separated(
        itemCount: reviews.length + 1, // زيادة العدد لإضافة المسافة الأولى
        itemBuilder: (context, index) {
          if (index == 0) {
            // عنصر المسافة بين AppBar والعنصر الأول
            return const SizedBox(height: 16.0);
          }
          final review = reviews[index - 1]; // مراجعة العنصر الصحيح
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(review['image']!),
                  radius: 25,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            review['name']!,
                            style: GoogleFonts.montserratAlternates(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            decoration: BoxDecoration(
                              // ignore: deprecated_member_use
                              color: AppColors.orange.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.star,
                                    color: AppColors.orange, size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  review['rating']!,
                                  style: GoogleFonts.montserratAlternates(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: AppColors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        review['date']!,
                        style: GoogleFonts.montserratAlternates(
                          fontSize: 12,
                          color: AppColors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      if (review['review']!.isNotEmpty)
                        Text(
                          review['review']!,
                          style: GoogleFonts.montserratAlternates(
                            fontSize: 14,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          // لا نضيف Divider بعد عنصر المسافة
          if (index == 0) return const SizedBox.shrink();
          return Divider(
            thickness: 1,
            // ignore: deprecated_member_use
            color: AppColors.grey.withOpacity(0.3),
            height: 16, // مسافة إضافية حول Divider
          );
        },
      ),
    );
  }
}