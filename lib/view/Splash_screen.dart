import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pendaftaran_ukm/view/login_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> 
with SingleTickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(Duration(seconds:2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const LoginPage(),));
    });
  }

  @override
  void dispose() {
     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
   body: Container(
    width: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.white, Colors.white],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // const Icon(
        // Icons.edit,
        // size: 80.0,
        // color: Colors.cyan,
        // ),
        SvgPicture.asset(
          'assets/pendaftaran.svg', // Pastikan path dan nama file sudah benar
          width: 300.0, // Sesuaikan lebar gambar
          height: 300.0, // Sesuaikan tinggi gambar
        ),
        SizedBox(height: 20),
        //Text("Restaurant B.L", style:  GoogleFonts.montserrat(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold, color: Color.fromARGB(232, 241, 240, 240)  ),),
        
      ],
    ),
   ),

    );
  }
}