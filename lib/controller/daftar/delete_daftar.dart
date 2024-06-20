// delete_controller.dart

import 'package:get/get.dart';
import 'package:pendaftaran_ukm/service/service_delete.dart';

class DeleteController extends GetxController {
  final UkmDeleteService ukmDeleteService = UkmDeleteService();

  Future<void> deleteRegistration(String id) async {
    try {
      await ukmDeleteService.deleteRegistration(id);
    } catch (e) {
      // Handle error as needed
      print('Error deleting registration: $e');
      rethrow; // Optionally rethrow to propagate the error
    }
  }
}
