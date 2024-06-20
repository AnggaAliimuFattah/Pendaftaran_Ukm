import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pendaftaran_ukm/controller/navigasi.dart';
import 'package:pendaftaran_ukm/controller/ukm_controller.dart';
import 'package:pendaftaran_ukm/view/detail_page.dart';
import 'package:pendaftaran_ukm/view/login_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
class HomeList extends StatefulWidget {
  const HomeList({super.key});

  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  final UKMController ukmController = Get.put(UKMController()); // Inisialisasi controller
  final NavigationController navigationController = Get.put(NavigationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B5EBF),
      appBar: AppBar(
        title: Text(
          'Cari UKM Favorite MU',
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: false,
        backgroundColor: const Color(0xff0B5EBF),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()), // Assuming this is your login page
              );
            },
            icon: const Icon(Icons.logout, color: Colors.white),
          ),
        ],
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
                  'assets/walpaper.png',
                  fit: BoxFit.cover,
                  width: 500,
                ),
                Expanded(
                  child: Obx(() {
                    return GridView.builder(
                      padding: const EdgeInsets.all(10.0),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 2 / 2.5,
                      ),
                      itemCount: ukmController.daftarUKM.length,
                      itemBuilder: (context, index) {
                        final ukm = ukmController.daftarUKM[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DetailPage(ukm: ukm)),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow:const [
                                 BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5.0,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.vertical(top: Radius.circular(15.0)),
                                    child: Image.asset(
                                      ukm.imageAsset,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ukm.title,
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4.0),
                                      Text(
                                        ukm.category,
                                        style: const TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),
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
          padding: EdgeInsets.all(17),
          color: Colors.white,
          activeColor: Colors.black,
          tabBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
          tabs: const [
            GButton(icon: Icons.home, text: 'Home',),
            GButton(icon: Icons.search, text: 'Search',),
            GButton(icon: Icons.edit, text: 'daftar',),
           
          ],
      );
    },
    ),
    );
  }
}

