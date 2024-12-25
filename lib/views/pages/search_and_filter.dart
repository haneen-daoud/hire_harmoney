import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hire_harmony/utils/app_colors.dart';
import 'package:hire_harmony/views/pages/emp_profile_details.dart';

class SearchAndFilter extends StatelessWidget {
  SearchAndFilter({super.key});
  final List<Map<String, dynamic>> cleaningServices = [
    {
      'name': 'Haneen Daoud',
      'location': 'Qalqilia,palestine ',
      'availability': 'Closed',
      'time': '1.2 hrs',
      'completedJobs': '42',
      'rating': 4.7,
      'reviews': 115,
      'image': "assets/images/teacher.jpg",
    },
    {
      'name': 'Ismeal  Sadeq',
      'location': 'Qalqilia, palestine',
      'availability': 'Available',
      'time': '2 hrs',
      'completedJobs': '5',
      'rating': 4.0,
      'reviews': 24,
      'image': "assets/images/mechanic.png",
    },
    {
      'name': 'Yahya  Nearat',
      'location': 'Qalqilia, palestine',
      'availability': 'Available',
      'time': '1.5 hrs',
      'completedJobs': '32',
      'rating': 3.9,
      'reviews': 32,
      'image': "assets/images/mechanic.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:const Size.fromHeight(100.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          flexibleSpace: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: AppColors.navy),
                    onPressed: () {
                      Navigator.pop(context);
                      // Handle back button
                    },
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(25),
                        //border color
                        border: Border.all(color: AppColors.grey3, width: 1),
                      ),
                      child: Row(
                        children: [
                          // Back button

                          Icon(
                            Icons.search,
                            color: AppColors.grey,
                            size: 20,
                          ),

                          const SizedBox(width: 10),
                          // Search bar
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Indoor Cleaning",
                                hintStyle: GoogleFonts.montserratAlternates(
                                  textStyle: TextStyle(
                                    fontSize: 13,
                                    color: AppColors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          // Clear button
                          GestureDetector(
                            onTap: () {
                              // Add logic for clearing input
                            },
                            child: Container(
                              width: 20,
                              height: 22,
                              decoration: BoxDecoration(
                                color: AppColors.black,
                                shape: BoxShape.circle,
                              ),
                              child: const Center(
                                child: Text(
                                  "x",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '3 results for "Indoor Cleaning" around Qalqilia',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Available Skillr\'s',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        // Implement sort functionality here
                      },
                      icon: Icon(Icons.sort, color: AppColors.navy),
                      label: Text(
                        'Sort By',
                        style: TextStyle(color: AppColors.navy),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cleaningServices.length,
              itemBuilder: (context, index) {
                final service = cleaningServices[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundImage: AssetImage(service['image']),
                                  
                                  
                                ),
                                const SizedBox(width: 8,),
                                 Text(
                              service['name'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                              ],
                            ),
                           
                            Row(
                              children: [
                                const Icon(Icons.star,
                                    color: Colors.amber, size: 20),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '${service['rating']} (${service['reviews']})',
                                  style: const TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.location_on, size: 20),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(service['location'],
                                style: const TextStyle(fontSize: 13)),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.money, size: 20),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Starts @  • ${service['time']}',
                              style: TextStyle(
                                  color: AppColors.grey, fontSize: 13),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.check_circle, size: 20),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              '${service['completedJobs']} similar jobs completed near you',
                              style: TextStyle(
                                  color: AppColors.grey, fontSize: 13),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Status: ${service['availability']}',
                              style: TextStyle(
                                color: service['availability'] == 'Available'
                                    ? Colors.green
                                    : Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            //evaluated button
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(AppColors.orange),
                              ),
                              onPressed: () {
                               
                               Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const EmpProfileDetails()),
                                );
                              },
                              child: Text(
                                'veiw profile',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
