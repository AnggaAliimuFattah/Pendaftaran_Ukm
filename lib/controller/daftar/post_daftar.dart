// lib/controller/daftar/post_daftar.dart
import 'package:get/get.dart';
import 'package:pendaftaran_ukm/service/service_post.dart';

class SubmitController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  final UkmaddService ukmService = UkmaddService();

  Future<bool> submitRegistration(String nama, String jurusan, String ukm, String nomorHp) async {
  try {
    isLoading(true);
    await ukmService.submitRegistration({
      'nama_lengkap': nama,
      'jurusan': jurusan,
      'unit_kegiatan': ukm,
      'nomor_hp': nomorHp,
    });
    return true; // Or whatever indicator you need
  } catch (e) {
    errorMessage(e.toString());
    return false; // Or handle error cases appropriately
  } finally {
    isLoading(false);
  }
}
}
