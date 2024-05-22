import 'package:flutter/material.dart';
import 'package:pendaftaran_ukm/view/home_list.dart';
//import 'package:restaurant_bucket_list/screens/home_restaurant_list.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:pendaftaran_ukm/view/regristasi_page.dart';
import 'package:pendaftaran_ukm/controller/auth_controller.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   late Color myColor;
  late Size mediaSize;
   final formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthController _authController = AuthController();
  bool isLoading = false;
  //late SharedPreferences logindata;
  late bool newUser;

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
                 onPressed:isLoading
                                ? null
                                : () async {
                                    if (formKey.currentState?.validate() ?? false) {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      try {
                                        await _authController.signInWithEmailAndPassword(
                                          email: _nameController.text,
                                          password: _passwordController.text,
                                        );
                                        // Navigate to home screen on successful login
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => HomeList(),
                                          ),
                                        );
                                      } catch (e) {
                                        // Handle error
                                        print('Error: $e');
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text('Login failed: $e'),
                                          ),
                                        );
                                      } finally {
                                        setState(() {
                                          isLoading = false;
                                        });
                                      }
                                    }
                            },
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent, // Background color
                    shadowColor: Colors.transparent, // No shadow
                    elevation: 0, // No elevation
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),          
                      child: isLoading
                                ? CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                  )
                                : Text(
                                    'LOGIN',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white,
                    ),),
                    ),
                  ),
                  ),
                   SizedBox(height: 20,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const RegristasiPage()),
                          );
                        },
                        child: Text('Register'), // Teks di dalam tombol
                      ),
                    ],
                  ),
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