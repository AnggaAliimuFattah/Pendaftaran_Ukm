class UkmRegistration {
  final String id;
  final String namaLengkap;
  final String jurusan;
  final String unitKegiatan;
  final String nomorHp;

  UkmRegistration({
    required this.id,
    required this.namaLengkap,
    required this.jurusan,
    required this.unitKegiatan,
    required this.nomorHp,
  });

  factory UkmRegistration.fromJson(Map<String, dynamic> json) {
    return UkmRegistration(
      id: json['id'],
      namaLengkap: json['nama_lengkap'],
      jurusan: json['jurusan'],
      unitKegiatan: json['unit_kegiatan'],
      nomorHp: json['nomor_hp'],
    );
  }
}
