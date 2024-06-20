import 'package:get/get.dart';
import 'package:pendaftaran_ukm/models/ukm_daftar.dart';
import 'package:pendaftaran_ukm/service/service_get.dart';

class UKMdaftarController extends GetxController {
  var ukmList = <UkmRegistration>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    fetchUkmRegistrations();
    super.onInit();
  }

  void fetchUkmRegistrations() async {
    try {
      isLoading(true);
      var ukmService = UkmService();
      var registrations = await ukmService.fetchUkmRegistrations();
      ukmList.assignAll(registrations);
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
