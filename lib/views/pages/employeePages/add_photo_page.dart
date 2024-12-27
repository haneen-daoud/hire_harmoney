/*import 'package:flutter/material.dart';
import 'package:hire_harmony/utils/app_colors.dart';

class PhotosSection extends StatelessWidget {
  const PhotosSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // قسم الصور
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Previous Work Photos',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.navy,
              ),
            ),
            SizedBox(height: 10),
            // Placeholder for photos grid
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: 6, // مثال على عدد الصور
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.grey.shade200,
                  child: Icon(Icons.image, color: AppColors.grey2),
                );
              },
            ),
          ],
        ),

        // زر الإضافة
        Positioned(
          bottom: 10,
          right: 10,
          child: FloatingActionButton(
            backgroundColor: AppColors.orange,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AddPhotoDialog(),
              );
            },
            child: Icon(Icons.add, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

// نافذة إضافة صورة
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
*/