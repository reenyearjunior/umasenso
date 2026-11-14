import 'package:flutter/material.dart';
import 'sign_in_screen.dart';
import 'app_shell.dart';
import '../app_shared.dart';

class LguRegisterScreen extends StatefulWidget {
  const LguRegisterScreen({super.key});

  @override
  State<LguRegisterScreen> createState() =>
      _LguRegisterScreenState();
}

class _LguRegisterScreenState extends State<LguRegisterScreen> {
  final formKey = GlobalKey<FormState>();

  final lguController = TextEditingController();
  final locationController = TextEditingController();
  final representativeController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();

  String? selectedDepartment;
  bool showPassword = false;

  final departments = [
    'Agriculture Office',
    'Municipal Planning Office',
    'Environment Office',
    'Information Technology Office',
    'Other',
  ];

  @override
  void dispose() {
    lguController.dispose();
    locationController.dispose();
    representativeController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
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

    if (selectedDepartment == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Pumili muna ng departamento.'),
        ),
      );
      return;
    }

    store.customerName = representativeController.text.trim();
    store.email = emailController.text.trim();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const AppShell(role: 'LGU'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8EC),
      appBar: AppBar(
        title: const Text('LGU Registration'),
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
                'Register Your LGU Office',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF087443),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Provide your local government office information to join UmaSenso.',
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 25),

              inputField(
                label: 'LGU Name',
                hint: 'e.g. City Government of Catbalogan',
                icon: Icons.account_balance,
                controller: lguController,
              ),
              const SizedBox(height: 20),

              inputField(
                label: 'Municipality or City',
                hint: 'Enter municipality or city',
                icon: Icons.location_city,
                controller: locationController,
              ),
              const SizedBox(height: 20),

              const Text(
                'Department',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF245D48),
                ),
              ),
              const SizedBox(height: 8),

              DropdownButtonFormField<String>(
                initialValue: selectedDepartment,
                decoration: InputDecoration(
                  hintText: 'Select Department',
                  prefixIcon: const Icon(
                    Icons.business,
                    color: Color(0xFF287653),
                  ),
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
                items: departments.map((department) {
                  return DropdownMenuItem(
                    value: department,
                    child: Text(department),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedDepartment = value;
                  });
                },
              ),
              const SizedBox(height: 20),

              inputField(
                label: 'Authorized Representative',
                hint: 'Full name of representative',
                icon: Icons.person,
                controller: representativeController,
              ),
              const SizedBox(height: 20),

              inputField(
                label: 'Official Contact Number',
                hint: '+63 912 345 6789',
                icon: Icons.phone,
                controller: phoneController,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),

              inputField(
                label: 'Official Email Address',
                hint: 'office@example.gov.ph',
                icon: Icons.email,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),

              inputField(
                label: 'Office Address',
                hint: 'Enter complete office address',
                icon: Icons.location_on,
                controller: addressController,
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