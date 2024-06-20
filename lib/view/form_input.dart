import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pendaftaran_ukm/controller/daftar/delete_daftar.dart';
import 'package:pendaftaran_ukm/controller/daftar/get_daftar.dart';
import 'package:pendaftaran_ukm/controller/daftar/post_daftar.dart';
import 'package:pendaftaran_ukm/controller/daftar/update_daftar.dart'; 
import 'package:pendaftaran_ukm/controller/navigasi.dart';

class InputDaftar extends StatefulWidget {
  const InputDaftar({Key? key}) : super(key: key);

  @override
  State<InputDaftar> createState() => _InputDaftarState();
}

class _InputDaftarState extends State<InputDaftar> {
  final UKMdaftarController ukMdaftarController = Get.put(UKMdaftarController());
  final SubmitController submitController = Get.put(SubmitController());
  final DeleteController deleteController = Get.put(DeleteController());
  final UpdateController updateController = Get.put(UpdateController()); // Instantiate UpdateController

  final TextEditingController nameController = TextEditingController();
  final TextEditingController jurusanController = TextEditingController();
  final TextEditingController ukmInputController = TextEditingController();
  final TextEditingController noTelponController = TextEditingController();

  final NavigationController navigationController = Get.put(NavigationController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

 void _showEditDialog(BuildContext context, String id, String currentName, String currentJurusan, String currentUkm, String currentNoTelpon) {
  final TextEditingController _editNameController = TextEditingController(text: currentName);
  final TextEditingController _editJurusanController = TextEditingController(text: currentJurusan);
  final TextEditingController _editUkmController = TextEditingController(text: currentUkm);
  final TextEditingController _editNoTelponController = TextEditingController(text: currentNoTelpon);

  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: const Text('Edit Pendaftaran'),
        content: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(controller: _editNameController, decoration: const InputDecoration(hintText: 'Nama')),
              TextFormField(controller: _editJurusanController, decoration: const InputDecoration(hintText: 'Jurusan')),
              TextFormField(controller: _editUkmController, decoration: const InputDecoration(hintText: 'UKM')),
              TextFormField(controller: _editNoTelponController, decoration: const InputDecoration(hintText: 'No Telpon')),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              updateController.updateRegistration(
                id,
                _editNameController.text,
                _editJurusanController.text,
                _editUkmController.text,
                _editNoTelponController.text,
              ).then((_) {
                ukMdaftarController.fetchUkmRegistrations(); // Refresh the list
                Navigator.of(dialogContext).pop(); // Close dialog
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Pendaftaran berhasil diupdate'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }).catchError((error) {
                // Handle error
                print('Error updating registration: $error');
                // Optionally show an error dialog
                Navigator.of(dialogContext).pop(); // Close dialog
              });
            },
            child: const Text('Update'),
          ),
        ],
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff0B5EBF),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Daftar UKM Disini",
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff0B5EBF),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: nameController,
                        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                          hintText: 'Nama',
                          hintStyle: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                          border: UnderlineInputBorder(),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nama tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: jurusanController,
                        decoration: const InputDecoration(
                          hintText: 'Jurusan',
                          hintStyle: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                          border: UnderlineInputBorder(),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Jurusan tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: ukmInputController,
                        decoration: const InputDecoration(
                          hintText: 'UKM',
                          hintStyle: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                          border: UnderlineInputBorder(),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'UKM tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: noTelponController,
                        decoration: const InputDecoration(
                          hintText: 'No Telpon',
                          hintStyle: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                          border: UnderlineInputBorder(),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'No Telpon tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          submitController.submitRegistration(
                            nameController.text,
                            jurusanController.text,
                            ukmInputController.text,
                            noTelponController.text,
                          ).then((_) {
                            ukMdaftarController.fetchUkmRegistrations(); // Refresh the list
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff0B5EBF),
                        minimumSize: Size(screenWidth * 0.8, 50),
                      ),
                      child: const Text(
                        'Kirim Pendaftaran',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'List Pendaftaran',
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff0B5EBF),
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      child: Obx(() {
                        if (ukMdaftarController.isLoading.value) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (ukMdaftarController.errorMessage.isNotEmpty) {
                          return Center(child: Text(ukMdaftarController.errorMessage.value));
                        } else if (ukMdaftarController.ukmList.isEmpty) {
                          return const Center(child: Text('No registrations found'));
                        } else {
                          return ListView.builder(
                            itemCount: ukMdaftarController.ukmList.length,
                            itemBuilder: (context, index) {
                              final ukm = ukMdaftarController.ukmList[index];
                              return ListTile(
                                title: Text(ukm.namaLengkap),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(ukm.jurusan),
                                    Text(ukm.unitKegiatan),
                                    Text(ukm.nomorHp),
                                  ],
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit, color: Colors.blue),
                                      onPressed: () {
                                        _showEditDialog(context, ukm.id.toString(), ukm.namaLengkap, ukm.jurusan, ukm.unitKegiatan, ukm.nomorHp);
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete, color: Colors.blue),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text('Hapus Pendaftaran'),
                                              content: const Text('Apakah Anda yakin ingin menghapus data pendaftaran ini?'),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: const Text('Batal'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                TextButton(
                                                  child: const Text('Hapus'),
                                                  onPressed: () {
                                                    deleteController.deleteRegistration(ukm.id.toString())
                                                      .then((_) {
                                                        ukMdaftarController.fetchUkmRegistrations(); // Refresh the list
                                                        Navigator.of(context).pop(); // Close dialog
                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                            const SnackBar(
                                                              content: Text('Pendaftaran berhasil dihapus'),
                                                              duration: Duration(seconds: 2),
                                                            ),
                                                          );
                                                      })
                                                      .catchError((error) {
                                                        // Handle error
                                                        print('Error deleting registration: $error');
                                                        // Optionally show an error dialog
                                                        Navigator.of(context).pop(); // Close dialog
                                                      });
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Obx(() {
        return GNav(
          selectedIndex: navigationController.selectedIndex.value,
          backgroundColor: const Color(0xff0B5EBF),
          gap: 4,
          onTabChange: (index) {
            navigationController.setSelectedIndex(index, context);
          },
          padding: const EdgeInsets.all(15),
          color: Colors.white,
          activeColor: Colors.black,
          tabBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.search,
              text: 'Search',
            ),
            GButton(
              icon: Icons.edit,
              text: 'Daftar',
            ),
          ],
        );
      }),
    );
  }
}
