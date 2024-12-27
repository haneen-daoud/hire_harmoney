import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hire_harmony/utils/app_colors.dart';

class PhotoTapView extends StatefulWidget {
  const PhotoTapView({super.key});

  @override
  State<PhotoTapView> createState() => _PhotoTapViewState();
}

class _PhotoTapViewState extends State<PhotoTapView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
              'Previous Work Photos',
              style: GoogleFonts.montserratAlternates(
                textStyle: TextStyle(
                  fontSize: 14,
                  color: AppColors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
              
               TextButton(
                  child: Text(
                    'See All',
                    style: TextStyle(
                      color: AppColors.orange,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: () {
                    // NAvigator to ReviewPage
                   
                  },
                ),
              
              
            ],
          ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child:  Row(
                children: [
                  WorkPhotoCard(
                    image: 'assets/images/Spring-Cleaning.jpg',
                    title: 'Pearl Facial',
                  ),
                  WorkPhotoCard(
                    image: 'assets/images/Spring-Cleaning.jpg',
                    title: 'Glow Facial',
                  ),
                ],
              ),
            ),

          ],
        ),
      ),

      // زر الإضافة الثابت
      floatingActionButton: FloatingActionButton(

        backgroundColor: AppColors.orange,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const AddPhotoDialog(),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

// واجهة إضافة صورة جديدة
class AddPhotoDialog extends StatelessWidget {
  const AddPhotoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'New Previous Work Photo',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.navy,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                // أضف وظيفة اختيار صورة
              },
              child: Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade200,
                ),
                child: const Icon(Icons.image, size: 50, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.navy,
                minimumSize: const Size(double.infinity, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                // أضف وظيفة الحفظ هنا
              },
              child: const Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// بطاقة الصور
class WorkPhotoCard extends StatelessWidget {
  final String image;
  final String title;

  const WorkPhotoCard({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      width: 180,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(image), 
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: Colors.black.withOpacity(0.6),
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

