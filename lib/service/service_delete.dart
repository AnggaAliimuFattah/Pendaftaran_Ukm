// service_delete.dart

import 'package:http/http.dart' as http;

class UkmDeleteService {
  final String baseUrl = 'https://667420ea75872d0e0a95350f.mockapi.io/ukm_daftar/form_pendaftaran';

  Future<void> deleteRegistration(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete registration');
    }
  }
}
