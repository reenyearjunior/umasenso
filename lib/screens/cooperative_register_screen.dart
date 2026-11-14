import 'package:flutter/material.dart';
import 'sign_in_screen.dart';
import 'app_shell.dart';
import '../app_shared.dart';

class CooperativeRegisterScreen extends StatefulWidget {
  const CooperativeRegisterScreen({super.key});

  @override
  State<CooperativeRegisterScreen> createState() =>
      _CooperativeRegisterScreenState();
}

class _CooperativeRegisterScreenState
    extends State<CooperativeRegisterScreen> {
  final formKey = GlobalKey<FormState>();

  final cooperativeController = TextEditingController();
  final registrationController = TextEditingController();
  final representativeController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final membersController = TextEditingController();
  final passwordController = TextEditingController();

  bool showPassword = false;

  @override
  void dispose() {
    cooperativeController.dispose();
    registrationController.dispose();
    representativeController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
    membersController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget inputField({
    required String label,
    required String hint,
    required IconData icon,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    bool password = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF245D48),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: password && !showPassword,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Please enter $label';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(
              icon,
              color: const Color(0xFF287653),
            ),
            suffixIcon: password
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      showPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  )
                : null,
            filled: true,
            fillColor: const Color(0xFFF8FAF1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: Color(0xFFD5DFD2),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void submitForm() {
    if (!formKey.currentState!.validate()) return;

    store.customerName = representativeController.text.trim();
    store.email = emailController.text.trim();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const AppShell(role: 'Kooperatiba'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8EC),
      appBar: AppBar(
        title: const Text('Cooperative Registration'),
        backgroundColor: const Color(0xFFF4F8EC),
        foregroundColor: const Color(0xFF245D48),
        elevation: 0,
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(22),
            children: [
              const Text(
                'Register Your Cooperative',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF087443),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Provide your cooperative information to join UmaSenso.',
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 25),

              inputField(
                label: 'Cooperative Name',
                hint: 'Enter cooperative name',
                icon: Icons.groups,
                controller: cooperativeController,
              ),
              const SizedBox(height: 20),

              inputField(
                label: 'Registration Number',
                hint: 'Enter official registration number',
                icon: Icons.badge,
                controller: registrationController,
              ),
              const SizedBox(height: 20),

              inputField(
                label: 'Representative Name',
                hint: 'Full name of authorized representative',
                icon: Icons.person,
                controller: representativeController,
              ),
              const SizedBox(height: 20),

              inputField(
                label: 'Contact Number',
                hint: '+63 912 345 6789',
                icon: Icons.phone,
                controller: phoneController,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),

              inputField(
                label: 'Email Address',
                hint: 'cooperative@example.com',
                icon: Icons.email,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),

              inputField(
                label: 'Cooperative Address',
                hint: 'Enter complete address',
                icon: Icons.location_on,
                controller: addressController,
              ),
              const SizedBox(height: 20),

              inputField(
                label: 'Number of Members',
                hint: 'Enter total number of members',
                icon: Icons.people,
                controller: membersController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),

              inputField(
                label: 'Password',
                hint: 'Create a password',
                icon: Icons.lock,
                controller: passwordController,
                password: true,
              ),
              const SizedBox(height: 30),

              SizedBox(
                height: 54,
                child: ElevatedButton(
                  onPressed: submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF32894D),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 22),
              const Center(
                child: Text(
                  'May account ka na ba?',
                  style: TextStyle(
                    color: Color(0xFF555555),
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Mag-login Dito',
                    style: TextStyle(
                      color: Color(0xFF087443),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}