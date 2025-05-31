import 'package:dairy_management/core/constants/app_constants.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final fullNameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final emailCtrl = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final fullName = fullNameCtrl.text.trim();
      final phone = phoneCtrl.text.trim();
      final email = emailCtrl.text.trim();

      print('Registering: $fullName, $phone, $email');
      // Proceed to next registration step
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(height: 12),

              // Title
              const Text(
                "Enter Registration Information",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'DMSans',
                ),
              ),
              const SizedBox(height: 8),

              // Subtitle
              const Text(
                "To get started, please provide your registration information.",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontFamily: 'DMSans',
                ),
              ),
              const SizedBox(height: 32),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Full Name
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Full Name',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'DMSans',
                            ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: fullNameCtrl,
                      decoration: const InputDecoration(
                        hintText: 'Enter Full Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) => value == null || value.isEmpty
                          ? 'Full name required'
                          : null,
                    ),

                    const SizedBox(height: 20),

                    // Phone Number
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Phone Number',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'DMSans',
                            ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: phoneCtrl,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: 'Enter Phone Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) => value == null || value.isEmpty
                          ? 'Phone number required'
                          : null,
                    ),

                    const SizedBox(height: 20),

                    // Email Address
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Email Address',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'DMSans',
                            ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: emailCtrl,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'Enter Email Address',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Email is required';
                        if (!value.contains('@')) return 'Enter valid email';
                        return null;
                      },
                    ),

                    const SizedBox(height: 32),

                    // Next Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed:
                            // _submit,
                            () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.of(
                              context,
                            ).pushNamed('/otp-verification');
                          }
                        },
                        // _submit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: 'DMSans',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Already have account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(fontFamily: 'DMSans'),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigater.pushNamed(context, '/login');
                      Navigator.of(context).pushReplacementNamed('/');
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: AppColors.primery,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        fontFamily: 'DMSans',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
