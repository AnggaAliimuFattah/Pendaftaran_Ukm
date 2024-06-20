import 'package:http/http.dart' as http;
import 'dart:convert';

class UpdateService {
  Future<void> updateRegistration(String id, String name, String jurusan, String ukm, String noTelpon) async {
    final response = await http.put(
      Uri.parse('https://667420ea75872d0e0a95350f.mockapi.io/ukm_daftar/form_pendaftaran/$id'), // Ganti dengan endpoint Anda
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'nama_lengkap': name,
        'jurusan': jurusan,
        'unit_kegiatan': ukm,
        'nomor_hp': noTelpon,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update registration');
    }
  }
}
