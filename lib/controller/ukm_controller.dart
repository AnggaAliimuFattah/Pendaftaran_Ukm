import 'package:get/get.dart';
import 'package:pendaftaran_ukm/models/model_Ukm.dart';

class UKMController extends GetxController {
  var daftarUKM = <UKMPendaftaran>[].obs;

  @override
  void onInit() {
    fetchUKMData();
    super.onInit();
  }

  void fetchUKMData() {
    var ukmList = [
      UKMPendaftaran(
        imageAsset: 'assets/tari.jpeg',
        title: 'UKM Seni Tari',
        category: 'Seni',
        description: 'Deskripsi UKM Seni Tari...',
        schedule: 'Senin - Jumat, 16:00 - 18:00',
        location: 'Gedung Seni Lantai 2',
      ),
      UKMPendaftaran(
        imageAsset: 'assets/voli.jpeg',
        title: 'UKM Volley Ball',
        category: 'Olahraga',
        description: 'Deskripsi UKM Olahraga...',
        schedule: 'Selasa & Kamis, 16:00 - 18:00',
        location: 'Lapangan Utama',
      ),
      UKMPendaftaran(
        imageAsset: 'assets/himatika.jpeg',
        title: 'UKM Himatika ',
        category: 'Organisasi',
        description: 'Deskripsi UKM Paduan Suara...',
        schedule: 'Rabu & Jumat, 16:00 - 18:00',
        location: 'Aula Utama',
      ),
      UKMPendaftaran(
        imageAsset: 'assets/Gdsc.jpeg',
        title: 'UKM GDSC ',
        category: 'Organisasi',
        description: 'Deskripsi UKM Paduan Suara...',
        schedule: 'Rabu & Jumat, 16:00 - 18:00',
        location: 'Aula Utama',
      ),

      UKMPendaftaran(
        imageAsset: 'assets/robot.jpeg',
        title: 'UKM Robot ',
        category: 'Organisasi',
        description: 'Deskripsi UKM Paduan Suara...',
        schedule: 'Rabu & Jumat, 16:00 - 18:00',
        location: 'Aula Utama',
      ),
      UKMPendaftaran(
        imageAsset: 'assets/broadcasting.jpeg',
        title: 'UKM Broadcasting ',
        category: 'Organisasi',
        description: 'Deskripsi UKM Paduan Suara...',
        schedule: 'Rabu & Jumat, 16:00 - 18:00',
        location: 'Aula Utama',
      ),

      // Add other UKMPendaftaran objects...
    ];
    daftarUKM.assignAll(ukmList);
  }
}
