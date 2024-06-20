// lib/service/service_post.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

class UkmaddService {
  final String baseUrl = 'https://667420ea75872d0e0a95350f.mockapi.io/ukm_daftar/form_pendaftaran';

  Future<void> submitRegistration(Map<String, dynamic> registrationData) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(registrationData),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to submit registration');
    }
  }
}
