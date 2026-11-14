
import 'package:flutter/material.dart';
import 'sign_in_screen.dart';
import 'app_shell.dart';
import '../app_shared.dart';

class BuyerRegisterScreen extends StatefulWidget {
  const BuyerRegisterScreen({super.key});

  @override
  State<BuyerRegisterScreen> createState() =>
      _BuyerRegisterScreenState();
}

class _BuyerRegisterScreenState extends State<BuyerRegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();

  String? selectedBusinessType;
  bool showPassword = false;

  final List<String> businessTypes = [
    'Restawran',
    'Grocery Store',
    'Tindero sa Palengke',
    'Tagaproseso ng Produkto',
    'Pang-sariling Gamit',
  ];

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget buildField({
    required String label,
    required String hint,
    required IconData icon,
    required TextEditingController controller,
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Color(0xFF245D48),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: isPassword && !showPassword,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Pakilagay ang iyong $label';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(
              icon,
              color: const Color(0xFF287653),
            ),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      showPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: const Color(0xFF287653),
                    ),
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                  )
                : null,
            filled: true,
            fillColor: const Color(0xFFF8FAF1),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 17,
              horizontal: 15,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: Color(0xFFD5DFD2),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: Color(0xFFD5DFD2),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: Color(0xFF287653),
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void nextStep() {
    if (!_formKey.currentState!.validate()) return;

    if (selectedBusinessType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Pumili muna ng uri ng negosyo.'),
        ),
      );
      return;
    }

    store.customerName = nameController.text.trim();
    store.email = emailController.text.trim();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const AppShell(role: 'Mamimili'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8EC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F8EC),
        foregroundColor: const Color(0xFF245D48),
        elevation: 0,
        title: const Text(
          'Pagpaparehistro ng Mamimili',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 15,
            ),
            children: [
              buildField(
                label: 'Buong Pangalan',
                hint: 'Juan Dela Cruz',
                icon: Icons.person,
                controller: nameController,
              ),

              const SizedBox(height: 22),

              const Text(
                'Uri ng Negosyo',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF245D48),
                ),
              ),
              const SizedBox(height: 8),

              DropdownButtonFormField<String>(
                initialValue: selectedBusinessType,
                decoration: InputDecoration(
                  hintText: 'Pumili ng uri ng negosyo',
                  prefixIcon: const Icon(
                    Icons.store,
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
                items: businessTypes.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedBusinessType = value;
                  });
                },
              ),

              const SizedBox(height: 22),

              buildField(
                label: 'Numero ng Telepono',
                hint: '+63 912 345 6789',
                icon: Icons.phone,
                controller: phoneController,
                keyboardType: TextInputType.phone,
              ),

              const SizedBox(height: 22),

              buildField(
                label: 'Email Address',
                hint: 'you@example.com',
                icon: Icons.email,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 22),

              buildField(
                label: 'Address ng Negosyo',
                hint: 'Hal. Brgy. San Isidro, Catbalogan, Samar',
                icon: Icons.location_on,
                controller: addressController,
              ),

              const SizedBox(height: 22),

              buildField(
                label: 'Password',
                hint: 'Gumawa ng password',
                icon: Icons.lock,
                controller: passwordController,
                isPassword: true,
              ),

              const SizedBox(height: 35),

              SizedBox(
                height: 54,
                child: ElevatedButton(
                  onPressed: nextStep,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF32894D),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Magpatuloy',
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
