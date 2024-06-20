import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pendaftaran_ukm/models/ukm_daftar.dart';
class UkmService {
  final String baseUrl = 'https://667420ea75872d0e0a95350f.mockapi.io/ukm_daftar/form_pendaftaran';

  Future<List<UkmRegistration>> fetchUkmRegistrations() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => UkmRegistration.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
