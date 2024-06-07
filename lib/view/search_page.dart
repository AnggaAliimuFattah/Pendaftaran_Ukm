import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pendaftaran_ukm/controller/navigasi.dart';
import 'package:pendaftaran_ukm/controller/ukm_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pendaftaran_ukm/view/detail_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  

  @override
  State<SearchPage> createState() => _SearchPageState();
  
}

class _SearchPageState extends State<SearchPage> {
  final UKMController ukmController = Get.put(UKMController());
  final NavigationController navigationController = Get.put(NavigationController());
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff0B5EBF),
      appBar: AppBar(
        leading: IconButton(
    icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white), // Icon panah kembali
    onPressed: () {
      Navigator.of(context).pop(); // Aksi untuk kembali ke layar sebelumnya
    },
  ),
  title: Text(
    "Cari UKM Disini",
    style: GoogleFonts.montserrat(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  centerTitle: true, // Menyisipkan judul ke tengah
  backgroundColor: const Color(0xff0B5EBF),
),
      body: Padding(
       padding: const EdgeInsets.only(top: 16.0),
       child: Container(
         width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            boxShadow: [
               BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                spreadRadius: 2,
              ),
            ],
       ),
          child: Padding(
             padding: const EdgeInsets.all(10.0),
             child: Column(
               children: [
                 Image.asset(
                  'assets/walpaper_dua.png',
                  fit: BoxFit.cover,
                  width: 500,
                ),
                Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Container(
                    decoration: BoxDecoration(
                   gradient: const LinearGradient(
                  colors: [Colors.blue, Colors.lightBlueAccent],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
                 child: TextField(
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(
                    hintText: 'Search',
                     hintStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  ),
                  onChanged: (query) {
                  ukmController.searchUKM(query);
                  },
                 ),
                 ),
             ),
                 Expanded(
                 child: Obx(() {
                    return ListView.builder(
                      itemCount: ukmController.searchResults.length,
                      itemBuilder: (context, index) {
                        var ukm = ukmController.searchResults[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                           // borderRadius: BorderRadius.circular(16),
                            child: ListTile(
                              leading: ClipRRect(
                                 borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  ukm.imageAsset,
                                  width: screenWidth * 0.12,
                                  height: screenWidth * 0.12,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(
                                ukm.title,
                                style: GoogleFonts.montserrat(
                                  fontSize: screenWidth * 0.04,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                ukm.category,
                                style: GoogleFonts.openSans(
                                  fontSize: screenWidth * 0.035,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () {
                               Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DetailPage(ukm: ukm)),
                            );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  })
                  ),
               ],
             ),
          ),
        ),
    ),
    bottomNavigationBar: Obx(() {
        return GNav(
          selectedIndex: navigationController.selectedIndex.value,
          backgroundColor: const Color(0xff0B5EBF),
          gap: 4,
          onTabChange: (index) {
            navigationController.setSelectedIndex(index, context); // Menggunakan fungsi navigasi yang diimpor
          },
          padding: const EdgeInsets.all(15),
          color: Colors.white,
          activeColor: Colors.black,
          tabBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
          tabs: const [
            GButton(icon: Icons.home, text: 'Home',),
            GButton(icon: Icons.search, text: 'Search',),
            GButton(icon: Icons.edit, text: 'Reviews',),
           
          ],
      );
    }),
    );
  }
}
