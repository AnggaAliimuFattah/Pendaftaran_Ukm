import 'package:get/get.dart';
import 'package:pendaftaran_ukm/models/model_Ukm.dart';

class UKMController extends GetxController {
  var daftarUKM = <UKMPendaftaran>[].obs;
  var searchResults = <UKMPendaftaran>[].obs;
  var searchTextController = ''.obs;

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
        location: 'Lab Robotik',
      ),
      UKMPendaftaran(
        imageAsset: 'assets/broadcasting.jpeg',
        imageSvg: 'assets/kampus.svg',
        title: 'UKM Broadcasting ',
        category: 'Organisasi',
        description: ' sebuah organisasi di lingkungan kampus yang fokus pada pengembangan minat dan bakat mahasiswa dalam bidang penyiaran, produksi konten media, dan jurnalisme. Tujuan utama UKM Broadcasting adalah untuk memberikan platform bagi mahasiswa untuk mengeksplorasi dunia penyiaran, mengasah keterampilan dalam produksi konten multimedia, dan mengembangkan kemampuan dalam bidang jurnalisme.',
        schedule: 'Rabu & Jumat, 16:00 - 18:00',
        location: 'Lab Broadcasting',
      ),
       UKMPendaftaran(
        imageAsset: 'assets/futsal.jpeg',
        imageSvg: 'assets/kampus.svg',
        title: 'UKM futsal ',
        category: 'Olahraga',
        description: 'organisasi yang menampung mahasiswa yang memiliki minat di bidang futsal, sebuah variasi sepak bola yang dimainkan di dalam ruangan dengan tim yang lebih kecil, biasanya terdiri dari lima pemain. UKM ini menyediakan platform bagi mahasiswa untuk mengembangkan keterampilan bermain futsal serta membangun kebugaran fisik, mental, dan kerjasama tim  menuntut kecepatan, kelincahan, serta kemampuan teknis yang tinggi dari para pemainnya.',
        schedule: 'Minggu, 8:00 - 10:00',
        location: 'Lapangan satu',
      ),
      UKMPendaftaran(
        imageAsset: 'assets/basket.jpeg',
        imageSvg: 'assets/kampus.svg',
        title: 'UKM Basket ',
        category: 'Olahraga',
        description: 'wadah bagi mahasiswa yang memiliki minat dan bakat di bidang olahraga bola basket. UKM ini menyediakan ruang bagi mahasiswa untuk mengembangkan keterampilan mereka dalam bermain basket. Kegiatan di UKM Basket tidak hanya berfokus pada aspek fisik seperti peningkatan kebugaran dan kekuatan, tetapi juga pada pengembangan keterampilan teknik, pemahaman strategi permainan, serta kerjasama tim yang solid.',
        schedule: 'Sabtu, 8:00 - 10:00',
        location: 'Lapangan satu',
      ),
      UKMPendaftaran(
        imageAsset: 'assets/pramuka.jpeg',
        imageSvg: 'assets/kampus.svg',
        title: 'UKM Pramuka ',
        category: 'Petualang',
        description: 'wadah bagi mahasiswa yang memiliki minat dan bakat di bidang kepramukaan. UKM ini bertujuan untuk mengembangkan keterampilan, pengetahuan, dan sikap positif mahasiswa melalui berbagai kegiatan kepramukaan. Pramuka tidak hanya berfokus pada pembentukan karakter yang mandiri, disiplin, dan bertanggung jawab, tetapi juga mengajarkan keterampilan praktis yang berguna dalam kehidupan sehari-hari dan situasi darurat.',
        schedule: 'Sabtu - Minggu, 18:00 - 10:00',
        location: 'Lapangan tiga',
      ),
      UKMPendaftaran(
        imageAsset: 'assets/musik.jpeg',
        imageSvg: 'assets/kampus.svg',
        title: 'UKM Band',
        category: 'Musik',
        description: 'organisasi yang mewadahi mahasiswa dengan minat dan bakat di bidang musik. UKM ini berfungsi sebagai ruang bagi mahasiswa untuk mengekspresikan diri melalui musik, mengembangkan keterampilan bermusik, dan memperluas pengetahuan mereka tentang berbagai genre musik. UKM Musik tidak hanya mengajarkan keterampilan teknis bermain alat musik dan vokal, tetapi juga mencakup aspek-aspek kreatif seperti penulisan lagu, aransemen, dan produksi musik.',
        schedule: 'Senin, 18:00 - Selesai',
        location: 'Lab Musik',
      ),
      UKMPendaftaran(
        imageAsset: 'assets/jurnalis.jpeg',
        imageSvg: 'assets/kampus.svg',
        title: 'UKM Jurnalis',
        category: 'Organisasi',
        description: 'organisasi yang mewadahi mahasiswa yang memiliki minat dan bakat dalam bidang jurnalistik. UKM ini bertujuan untuk mengembangkan keterampilan jurnalistik mahasiswa, mulai dari menulis berita, reportase, wawancara, fotografi, hingga editing dan desain media. UKM Jurnalis berperan penting dalam melatih mahasiswa menjadi jurnalis yang kompeten, kritis, dan beretika.UKM Jurnalis juga mengajarkan nilai-nilai dasar jurnalisme seperti objektivitas, akurasi, dan tanggung jawab sosial.',
        schedule: 'Senin, 16:00 - Selesai',
        location: 'Lab Audium',
      ),
      UKMPendaftaran(
        imageAsset: 'assets/Tenis.jpeg',
        imageSvg: 'assets/kampus.svg',
        title: 'UKM Tenis Meja',
        category: 'Olahraga',
        description: 'organisasi yang mewadahi mahasiswa yang memiliki minat dan bakat dalam olahraga tenis meja. UKM ini berfungsi sebagai tempat untuk mengembangkan keterampilan bermain tenis meja, meningkatkan kebugaran fisik, serta membangun sportivitas dan kerjasama tim. Tenis meja adalah olahraga yang menuntut kecepatan, ketepatan, dan konsentrasi tinggi, sehingga latihan rutin dan kompetisi sangat penting dalam pengembangan kemampuan pemain.',
        schedule: 'kamis, 16:00 - Selesai',
        location: 'Lapangan dua',
      ),
      UKMPendaftaran(
        imageAsset: 'assets/katolik.jpeg',
        imageSvg: 'assets/kampus.svg',
        title: 'UKM Persekutuan Mahasiswa Kristen Katolik',
        category: 'Organisasi',
        description: 'UKM Persekutuan Mahasiswa Kristen Katolik adalah organisasi kemahasiswaan yang menyediakan wadah bagi mahasiswa beragama Kristen Katolik untuk berkumpul, beribadah, dan memperdalam iman. UKM ini bertujuan untuk memperkuat spiritualitas anggotanya, meningkatkan pengetahuan agama, serta membangun komunitas yang saling mendukung dalam kehidupan kampus. Melalui berbagai kegiatan rohani, sosial, dan edukatif, UKM ini berperan penting dalam membantu mahasiswa menjalani kehidupan yang seimbang antara akademik dan iman.',
        schedule: 'Minggu, 15:00 - Selesai',
        location: 'Ruang Agama',
      ),
       UKMPendaftaran(
        imageAsset: 'assets/mc.jpeg',
        imageSvg: 'assets/kampus.svg',
        title: 'UKM Master Of Ceremony',
        category: 'Organisasi',
        description: 'organisasi yang mewadahi mahasiswa yang tertarik untuk mengembangkan keterampilan berbicara di depan umum dan menjadi pembawa acara profesional. UKM ini bertujuan untuk melatih anggotanya dalam berbagai aspek kepemimpinan acara, termasuk teknik berbicara, penguasaan panggung, improvisasi, dan etika profesional sebagai MC. Melalui pelatihan intensif dan pengalaman praktis, UKM MC membantu mahasiswa menjadi pembawa acara yang percaya diri, komunikatif, dan mampu memimpin berbagai jenis acara dengan sukses.',
        schedule: 'Selasa, 15:00 - Selesai',
        location: 'Ruang Kelas',
      ),
       UKMPendaftaran(
        imageAsset: 'assets/izza.jpeg',
        imageSvg: 'assets/kampus.svg',
        title: 'UKM Al-Izza',
        category: 'Organisasi',
        description: 'organisasi kemahasiswaan yang berfokus pada pengembangan pemahaman dan praktik keagamaan Islam di kalangan mahasiswa. UKM ini bertujuan untuk memperkuat keimanan, meningkatkan pengetahuan agama, serta membangun komunitas yang harmonis dan berakhlak mulia. Melalui berbagai kegiatan spiritual, edukatif, dan sosial, UKM Al Izzah menyediakan platform bagi mahasiswa untuk menjalani kehidupan yang seimbang antara akademik dan spiritual. UKM Al Izzah berperan penting dalam membina mahasiswa agar dapat mengamalkan ajaran Islam dalam kehidupan sehari-hari, serta berkontribusi positif bagi lingkungan kampus dan masyarakat luas.',
        schedule: 'Sabtu, 15:00 - Selesai',
        location: 'Ruang Kelas',
      ),
      UKMPendaftaran(
        imageAsset: 'assets/smart.jpeg',
        imageSvg: 'assets/kampus.svg',
        title: 'UKM Smart Coding',
        category: 'Organisasi',
        description: 'organisasi kemahasiswaan yang berfokus pada pengembangan keterampilan pemrograman dan teknologi informasi. UKM ini bertujuan untuk mengajarkan dan meningkatkan kemampuan coding mahasiswa, memperkenalkan mereka pada berbagai bahasa pemrograman, dan memberikan kesempatan untuk mengerjakan proyek-proyek teknologi. Dengan dukungan dari berbagai kegiatan edukatif, UKM ini membantu anggotanya untuk menjadi programmer yang kompeten dan siap bersaing di dunia teknologi. Selain itu, UKM Mulia Smart Coding juga mendorong anggotanya untuk selalu berinovasi, berpikir kritis, dan mampu menyelesaikan masalah secara efektif melalui penggunaan teknologi.',
        schedule: 'Senin, 18:00 - Selesai',
        location: 'Ruang Coding',
      ),
       UKMPendaftaran(
        imageAsset: 'assets/cinema.jpeg',
        imageSvg: 'assets/kampus.svg',
        title: 'UKM Cinematography',
        category: 'Organisasi',
        description: 'organisasi kemahasiswaan yang berfokus pada pengembangan keterampilan dan minat mahasiswa di bidang pembuatan film dan produksi video. UKM ini bertujuan untuk menyediakan platform bagi para anggotanya untuk belajar, berkreasi, dan mengasah kemampuan dalam berbagai aspek sinematografi, termasuk penulisan naskah, penyutradaraan, pengambilan gambar, penyuntingan, dan produksi film. Melalui serangkaian kegiatan edukatif dan praktis, UKM ini berkomitmen untuk membantu anggotanya menjadi kreator konten yang inovatif dan profesional di dunia perfilman dan multimedia.',
        schedule: 'Rabu, 19:00 - Selesai',
        location: 'Ruang Cinema',
      ),
      UKMPendaftaran(
        imageAsset: 'assets/hacker.jpeg',
        imageSvg: 'assets/kampus.svg',
        title: 'UKM Cyber Security',
        category: 'Organisasi',
        description: 'organisasi kemahasiswaan yang berfokus pada pengembangan keterampilan dan pengetahuan di bidang keamanan siber. UKM ini bertujuan untuk membekali mahasiswa dengan pemahaman mendalam tentang berbagai aspek keamanan digital, termasuk pencegahan ancaman siber, penanganan insiden, serta pengembangan dan penerapan kebijakan keamanan. Melalui berbagai kegiatan edukatif dan praktis, UKM ini berkomitmen untuk menghasilkan individu yang ahli dan siap bersaing di dunia keamanan siber yang semakin kompleks dan dinamis.untuk menciptakan lingkungan yang mendukung bagi mahasiswa untuk belajar, berinovasi, dan berkembang dalam bidang keamanan siber. Anggota UKM ini akan mendapatkan pengalaman berharga',
        schedule: 'kamis, 13:00 - Selesai',
        location: 'Ruang Cyber Security',
      ),
       UKMPendaftaran(
        imageAsset: 'assets/grapic.jpeg',
        imageSvg: 'assets/kampus.svg',
        title: 'UKM Graphic Designer and Animation',
        category: 'Organisasi',
        description: 'organisasi kemahasiswaan yang berfokus pada pengembangan keterampilan dan kreativitas dalam bidang desain grafis dan animasi. UKM ini bertujuan untuk membekali mahasiswa dengan kemampuan teknis dan artistik yang diperlukan untuk menciptakan karya visual yang menarik dan fungsional. Melalui berbagai kegiatan edukatif dan praktis, UKM ini berkomitmen untuk membantu anggotanya menjadi desainer grafis dan animator yang kompeten dan inovatif, serta siap bersaing di dunia industri kreatif. untuk menciptakan lingkungan yang mendukung bagi mahasiswa untuk belajar, berinovasi, dan berkembang dalam bidang desain grafis dan animasi.',
        schedule: 'jumat, 13:00 - Selesai',
        location: 'Ruang Grapic Designer',
      ),
      UKMPendaftaran(
        imageAsset: 'assets/paduan.jpeg',
        imageSvg: 'assets/kampus.svg',
        title: 'UKM Paduan Suara',
        category: 'Seni',
        description: 'organisasi kemahasiswaan yang menjadi rumah bagi para pecinta musik vokal di lingkungan kampus. Dibentuk dengan semangat untuk menggali dan mengekspresikan bakat musik vokal mahasiswa, UKM ini telah menjadi wahana bagi mereka untuk menyalurkan minat serta mengasah kemampuan vokal mereka dalam sebuah komunitas yang mendukung dan inspiratif.Dengan semangat kebersamaan dan komitmen untuk mencapai standar keunggulan dalam musik vokal, UKM Paduan Suara terus menjadi tempat yang inspiratif bagi para mahasiswa yang memiliki cinta dan dedikasi terhadap seni musik vokal.',
        schedule: 'jumat, 14:00 - Selesai',
        location: 'Ruang Paduan Suara',
      ),
       UKMPendaftaran(
        imageAsset: 'assets/badminton.jpeg',
        imageSvg: 'assets/kampus.svg',
        title: 'UKM Badminton',
        category: 'Olahraga',
        description: 'wadah bagi mahasiswa yang memiliki minat dan bakat dalam olahraga bulu tangkis. Menempatkan kebugaran fisik dan keahlian teknis sebagai fokus utama, UKM ini tidak hanya menjadi tempat untuk meningkatkan kemampuan atletik, tetapi juga untuk memperdalam pemahaman tentang strategi permainan dan membangun kerja sama tim yang solid.Dengan komitmen untuk menghasilkan atlet yang berkualitas dan bertanggung jawab, UKM Badminton tidak hanya menjadi tempat untuk berlatih dan bersaing, tetapi juga menjadi komunitas yang menyenangkan dan mendukung bagi para pecinta bulu tangkis di kampus.',
        schedule: 'jumat, 16:00 - Selesai',
        location: 'Lapangan Tiga',
      ),
        UKMPendaftaran(
        imageAsset: 'assets/MEB.png',
        imageSvg: 'assets/kampus.svg',
        title: 'Badan Eksekutif Mahasiswa',
        category: 'Organisasi',
        description: 'Organisasi yang menjadi wadah utama bagi mahasiswa untuk berpartisipasi dalam pembangunan dan pengelolaan kegiatan di lingkungan kampus. Sebagai representasi mahasiswa di tingkat eksekutif, BEM memiliki peran penting dalam mengadvokasi kepentingan mahasiswa, menyelenggarakan berbagai kegiatan kemahasiswaan, serta menjembatani hubungan antara mahasiswa, pihak kampus, dan masyarakat umum.memegang peran yang sangat vital dalam menjaga dan mengembangkan kehidupan kemahasiswaan di kampus. Dengan kinerja yang transparan, responsif, dan partisipatif, ',
        schedule: 'Senin & Selasa, 16:00 - Selesai',
        location: 'Ruangan BEM',
      ),
      // Add other UKMPendaftaran objects...
    ];
    daftarUKM.assignAll(ukmList);
    searchResults.assignAll(ukmList);
  }
  void searchUKM(String query) {
    if (query.isEmpty) {
      searchResults.assignAll(daftarUKM);
    } else {
      searchResults.assignAll(daftarUKM.where((ukm) => ukm.title.toLowerCase().contains(query.toLowerCase())).toList());
    }
  }
}
