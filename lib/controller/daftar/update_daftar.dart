import 'package:get/get.dart';
import 'package:pendaftaran_ukm/service/service_put.dart';


class UpdateController extends GetxController {
  final UpdateService updateService = UpdateService();

  Future<void> updateRegistration(String id, String name, String jurusan, String ukm, String noTelpon) async {
    try {
      await updateService.updateRegistration(id, name, jurusan, ukm, noTelpon);
    } catch (e) {
      rethrow;
    }
  }
}
