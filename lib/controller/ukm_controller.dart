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
        imageSvg: 'assets/kampus.svg',
        title: 'UKM Seni Tari',
        category: 'Seni',
        description: 'Unit Kegiatan Mahasiswa (UKM) Seni Tari adalah sebuah organisasi di lingkungan kampus yang berfokus pada pengembangan minat dan bakat mahasiswa dalam bidang seni tari. UKM ini menjadi wadah bagi mahasiswa yang memiliki ketertarikan dan passion di dunia tari untuk belajar, berlatih, dan mengekspresikan diri melalui berbagai jenis tarian, baik tradisional maupun modern.',
        schedule: 'Senin - Jumat, 16:00 - 18:00',
        location: 'Gedung Seni Lantai 2',
      ),
      UKMPendaftaran(
        imageAsset: 'assets/voli.jpeg',
        imageSvg: 'assets/kampus.svg',
        title: 'UKM Volley Ball',
        category: 'Olahraga',
        description: 'UKM Vlloey adalah sebuah organisasi di lingkungan kampus yang menekankan pada pengembangan minat dan bakat mahasiswa dalam bidang olahraga bola voli. Sebagai wadah bagi para pecinta bola voli, UKM Vlloey berkomitmen untuk memberikan pelatihan, kompetisi, serta pengalaman bermain dan belajar yang berharga bagi anggotanya.',
        schedule: 'Selasa & Kamis, 16:00 - 18:00',
        location: 'Lapangan Utama',
      ),
      UKMPendaftaran(
        imageAsset: 'assets/himatika.jpeg',
        imageSvg: 'assets/kampus.svg',
        title: 'UKM Himatika ',
        category: 'Organisasi',
        description: 'sebuah organisasi di lingkungan kampus yang bertujuan untuk memfasilitasi mahasiswa jurusan Teknik Informatika dalam mengembangkan diri, baik secara akademis maupun non-akademis. HIMTIKA menjadi wadah bagi para mahasiswa Teknik Informatika untuk saling berbagi pengetahuan, pengalaman, dan minat dalam bidang teknologi informasi.',
        schedule: 'Rabu & Jumat, 16:00 - 18:00',
        location: 'Aula Utama',
      ),
      UKMPendaftaran(
        imageAsset: 'assets/Gdsc.jpeg',
        imageSvg: 'assets/kampus.svg',
        title: 'UKM GDSC ',
        category: 'Organisasi',
        description: 'Google Developer Student Clubs (GDSC) adalah program dari Google yang berfokus pada pengembangan keahlian teknis dan keterampilan pemecahan masalah di kalangan mahasiswa. GDSC dijalankan oleh mahasiswa untuk mahasiswa di perguruan tinggi di seluruh dunia. Tujuan utamanya adalah untuk memberikan platform bagi mahasiswa untuk belajar, berbagi, dan mengembangkan proyek teknologi bersama.',
        schedule: 'Sabtu & Minggu, 16:00 - 18:00',
        location: 'Lab Komputer',
      ),

      UKMPendaftaran(
        imageAsset: 'assets/robot.jpeg',
        imageSvg: 'assets/kampus.svg',
        title: 'UKM Robot ',
        category: 'Organisasi',
        description: ' sebuah organisasi di lingkungan kampus yang berfokus pada pengembangan dan eksplorasi teknologi robotika di kalangan mahasiswa. Tujuan utama dari UKM Robot adalah untuk menyediakan platform bagi mahasiswa untuk belajar, bereksperimen, dan berinovasi dalam bidang robotika. Organisasi ini membantu mahasiswa untuk mengembangkan keterampilan teknis, memperluas pengetahuan mereka tentang robotika.',
        schedule: 'Senin & Selasa, 16:00 - 18:00',
        location: 'Lab Komputer',
      ),
      UKMPendaftaran(
        imageAsset: 'assets/broadcasting.jpeg',
        imageSvg: 'assets/kampus.svg',
        title: 'UKM Broadcasting ',
        category: 'Organisasi',
        description: ' sebuah organisasi di lingkungan kampus yang fokus pada pengembangan minat dan bakat mahasiswa dalam bidang penyiaran, produksi konten media, dan jurnalisme. Tujuan utama UKM Broadcasting adalah untuk memberikan platform bagi mahasiswa untuk mengeksplorasi dunia penyiaran, mengasah keterampilan dalam produksi konten multimedia, dan mengembangkan kemampuan dalam bidang jurnalisme.',
        schedule: 'Rabu & Jumat, 16:00 - 18:00',
        location: 'Lab Robotik',
      ),

      // Add other UKMPendaftaran objects...
    ];
    daftarUKM.assignAll(ukmList);
  }
}
