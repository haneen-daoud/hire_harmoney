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
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
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
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  WorkPhotoCard(
                    image: 'https://via.placeholder.com/150',
                    title: 'Pearl Facial',
                  ),
                  WorkPhotoCard(
                    image: 'https://via.placeholder.com/150',
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
            builder: (context) => AddPhotoDialog(),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
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
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 16),
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
                child: Icon(Icons.image, size: 50, color: Colors.grey),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.navy,
                minimumSize: Size(double.infinity, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                // أضف وظيفة الحفظ هنا
              },
              child: Text(
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
      margin: EdgeInsets.only(right: 8),
      width: 180,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
