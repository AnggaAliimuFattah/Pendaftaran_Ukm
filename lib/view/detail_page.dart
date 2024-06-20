import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pendaftaran_ukm/models/model_Ukm.dart';
import 'package:pendaftaran_ukm/view/form_input.dart';
import 'package:pendaftaran_ukm/view/home_list.dart';
import 'package:flutter_svg/flutter_svg.dart';


class DetailPage extends StatelessWidget {
  final UKMPendaftaran ukm;

  const DetailPage({super.key, required this.ukm});

  @override
  Widget build(BuildContext context) {
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
    "Detail UKM",
    style: GoogleFonts.montserrat(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  centerTitle: true, // Menyisipkan judul ke tengah
  backgroundColor: const Color(0xff0B5EBF),
),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ukm.imageAsset),
                fit: BoxFit.cover,
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.5,
            maxChildSize: 0.9,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.linear_scale,
                          size: 24.0,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 15),
                      // SvgPicture.asset(
                      //   ukm.imageSvg,
                      //   width: 200, // Atur lebar gambar sesuai kebutuhan
                      //   height: 200,
                      // ),

                      // const SizedBox(height: 12),
                      Text(
                        ukm.title,
                        style: GoogleFonts.montserrat(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Jadwal || ${ukm.schedule}',
                        style: GoogleFonts.openSans(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color:  Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                       Text(
                        'Lokasi - ${ukm.location}',
                        style: GoogleFonts.openSans(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color:  const Color(0xff0B5EBF),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Deskripsi:",
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff0B5EBF),
                        ),
                      ),
                      Text(
                        ukm.description ?? "Tidak ada deskripsi",
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildDetailSection(ukm.category),
                       const SizedBox(height: 100),
                        _buildButton(context),

                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDetailSection( String content) {
  return Container(
    width: 150, // Lebar kotak
    height: 50, // Tinggi kotak
    decoration: BoxDecoration(
      color: const Color(0xff0B5EBF), // Warna latar belakang kotak
      borderRadius: BorderRadius.circular(10), // Mengatur sudut bulatan kotak
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5), // Warna bayangan
          spreadRadius: 2, // Radius penyebaran bayangan
          blurRadius: 5, // Radius blur bayangan
          offset: const Offset(0, 3), // Offset bayangan dari kotak
        ),
      ],
    ),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0), // Padding untuk jarak antara teks dan tepi kotak
        child: Text(
          content,
          textAlign: TextAlign.center, // Penempatan teks di tengah
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
  ),
  );
  }
  Widget _buildButton(BuildContext context) {
  return Container(
    width: double.infinity, // Mengambil lebar maksimum
    padding: const EdgeInsets.symmetric(horizontal: 20), // Padding horizontal
    child: ElevatedButton(
      onPressed: () {
       Navigator.push(
       context,
      MaterialPageRoute(builder: (context) => const InputDaftar()),
      );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff0B5EBF), // Warna latar belakang tombol
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Mengatur sudut bulatan tombol
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10), // Padding vertikal
        child: Text(
          'Daftar Sekarang',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
}
