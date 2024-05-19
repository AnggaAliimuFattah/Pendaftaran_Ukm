import 'package:flutter/material.dart';
//import 'package:restaurant_bucket_list/screens/home_restaurant_list.dart';
//import 'package:shared_preferences/shared_preferences.dart';




class RegristasiPage extends StatefulWidget {
  const RegristasiPage({super.key});

  @override
  State<RegristasiPage> createState() => _RegristasiPageState();
}

class _RegristasiPageState extends State<RegristasiPage> {
   late Color myColor;
  late Size mediaSize;
   final formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  //late SharedPreferences logindata;
  late bool newUser;

    @override
  // void initState() {
  //   super.initState();
  //   checkLogin();
  // }

  // void checkLogin() async {
  //   logindata = await SharedPreferences.getInstance();
  //   newUser = logindata.getBool('login') ?? true;

  //   if (newUser == false) {
  //     Navigator.pushAndRemoveUntil(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => const RestaurantListHome(),
  //         ),
  //         (route) => false);
  //   }
  // }

@override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
   return Scaffold(
        body: Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xff0B5EBF),
              Color(0xff0B5EBF),
            ]),
          ),
          child: const Padding(
            padding: EdgeInsets.only(top: 60.0, left: 80),
            child: Text(
              'Hello Students\nUniversitas Mulia',
              key: Key("My Login Page"),
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ), 
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 70),
          Image.asset(
            "assets/jari.png",
            width: 69.0,
            height: 69.0,
            fit: BoxFit.cover,
          ),
        ],
      ),
        Padding(
          padding: const EdgeInsets.only(top: 200.0),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              color: Colors.white,
            ),
            height: double.infinity,
            width: double.infinity,
            child:  Padding(
              padding: const EdgeInsets.only(left: 18.0,right: 18),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formKey,
                child: ListView(
                children: [
                   TextFormField(
                    key: Key("Username Text Field"),
                    controller:  _nameController,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.check,color: Colors.grey,),
                      label: Text('Email',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color:Color(0xff0B5EBF),
                      ),)
                    ),
                     validator: (value) {
                    if (value != null && value.length < 5) {
                      return 'Enter min. 5 characters';
                    } else {
                      return null; //form is valid
                    }
                  },
                  ),
                   TextFormField(
                    key: Key("Password Text Field"),
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.visibility_off,color: Colors.grey,),
                        label: Text('Password',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:Color(0xff0B5EBF),
                        ),)
                    ),
                         validator: (value) {
                          if (value != null && value.length < 4) {
                            return 'Enter at least 5 characters';
                          } else {
                            return null; //form is valid
                          }
                        },
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    height: 55,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xff0B5EBF),
                          Color(0xff0B5EBF),
                        ]
                      ),
                    ),
                child: Center(
                child: ElevatedButton(
                  key: Key("Submit Login Button"),
                  // perubahan dsisni
                 onPressed: () {
                // final isValidForm = formKey.currentState!.validate();
                //       if (isValidForm) {
                //                 String username = _nameController.text;
                //                 String password = _passwordController.text;

                //                 if (username == 'admin' &&
                //                     password == 'admin') {
                //                   logindata.setBool('login', false);
                //                   logindata.setString('username', username);

                //                   showDialog(
                //                     context: context,
                //                     builder: (context) {
                //                       return AlertDialog(
                //                         title: Text('Login Successful'),
                //                         content: Text('Anda berhasil login'),
                //                         actions: [
                //                           TextButton(
                //                             onPressed: () {
                //                               Navigator.pushAndRemoveUntil(
                //                                 context,
                //                                 MaterialPageRoute(
                //                                   builder: (context) =>
                //                                     //  const RestaurantListHome(),
                //                                 ),
                //                                 (route) => false,
                //                               );
                //                             },
                //                             child: Text('OK'),
                //                           ),
                //                         ],
                //                       );
                //                     },
                //                   );
                //                 } else {
                //                   showDialog(
                //                     context: context,
                //                     builder: (context) {
                //                       return AlertDialog(
                //                         title: Text('Login Failed'),
                //                         content: Text(
                //                             'Username atau password Anda salah'),
                //                         actions: [
                //                           TextButton(
                //                             onPressed: () {
                //                               Navigator.of(context).pop();
                //                             },
                //                             child: Text('OK'),
                //                           ),
                //                         ],
                //                       );
                //                     },
                //                   );
                //                 }
                //               }
                            },
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent, // Background color
                    shadowColor: Colors.transparent, // No shadow
                    elevation: 0, // No elevation
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),          
                      child: Text('DAFTAR',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white
                    ),),
                    ),
                  ),
                  ),
                  //  SizedBox(height: 20,),
                  //    Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text(
                  //       'Don\'t have an account?',
                  //       style: TextStyle(color: Colors.grey),
                  //     ),
                  //     TextButton(
                  //       onPressed: () {
                  //         // Navigator.push(
                  //         //   context,
                  //         //   MaterialPageRoute(builder: (context) => const RegisterPage()),
                  //         // );
                  //       },
                  //       child: Text('Register'), // Teks di dalam tombol
                  //     ),
                  //   ],
                  // ),
                  SizedBox(height: 150),  // Space between buttons and icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Image.asset('assets/github.png',width: 60, height: 60), // Using custom image
                  onPressed: () {
                    // Logic for GitHub login or redirection
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/twitter.png',width: 60, height: 60), // Using flutter_icon
                  onPressed: () {
                    // Logic for Twitter login or redirection
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/facebook.png',width: 60, height: 60), // Using custom image
                  onPressed: () {
                    // Logic for Facebook login or redirection
                  },
                ),
                ],
              ),
                ],
            ),
          ),
        ),
        ),
        ),
      ], 
    ));
  }
}