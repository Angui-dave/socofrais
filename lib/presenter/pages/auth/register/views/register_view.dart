import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socofrais/presenter/pages/auth/login/views/login_view.dart';
import 'package:socofrais/presenter/pages/home/views/home_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 310,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/tomatep1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Positioned(
                      top: 270,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        height: 419,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[300]!,
                              blurRadius: 0.1,
                              spreadRadius: 0.1,
                              offset: const Offset(3.0, 3.0),
                            ),
                          ],
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              const Text(
                                'Inscription',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 30),
                              TextFormField(
                                cursorColor: Colors.red,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.person),
                                  prefixIconColor: Colors.red,
                                  hintText: 'Votre nom',
                                  fillColor: Colors.grey.shade300,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                cursorColor: Colors.red,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.email_outlined),
                                  prefixIconColor: Colors.red,
                                  hintText: 'Votre email',
                                  fillColor: Colors.grey.shade300,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                cursorColor: Colors.red,
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.lock),
                                  prefixIconColor: Colors.red,
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                    icon: Icon(
                                      _obscureText
                                          ? Icons.visibility_off
                                          : Icons.remove_red_eye,
                                      color: Colors.red,
                                    ),
                                  ),
                                  hintText: 'Mot de passe',
                                  fillColor: Colors.grey.shade300,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 45),
                              // ElevatedButton(
                              //   onPressed: () {
                              //     if (_formKey.currentState!.validate()) {}
                              //     Get.to(() => const HomeView());
                              //   },
                              //   child: const Text('Connexion'),
                              // ),
                              InkWell(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {}
                                  Get.to(() => const HomeView());
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25))),
                                  child: const Center(
                                    child: Text(
                                      'Inscription',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text("Avez-vous un compte ?"),
                                  const SizedBox(width: 5),
                                  TextButton(
                                    onPressed: () {
                                      Get.to(() => const LoginView());
                                    },
                                    child: const Text(
                                      'Connexion.',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
