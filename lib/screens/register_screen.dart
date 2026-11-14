
import 'package:flutter/material.dart';
import '../app_shared.dart';
import 'app_shell.dart';
import 'sign_in_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int _currentStep = 0;

  final fullNameController = TextEditingController();
  final nicknameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final farmNameController = TextEditingController();
  final farmSizeController = TextEditingController();

  String? selectedBarangay;
  String? selectedMunicipality;
  String? selectedExperience;

  final List<String> selectedCrops = ['Palay'];

  final List<String> barangays = [
    'Barangay 1',
    'Barangay 2',
    'Barangay 3',
    'Sucabon',
    'Pintuyan',
  ];

  final List<String> municipalities = [
    'Catbalogan City',
    'Basey',
    'Calbayog',
    'Tarangnan',
  ];

  final List<String> cropsList = [
    'Palay',
    'Mais',
    'Gulay',
    'Prutas',
    'Iba pa',
  ];

  final List<String> experienceYears = [
    '1-2 years',
    '3-5 years',
    '5-10 years',
    '10+ years',
  ];

  bool hidePassword = true;
  bool hideConfirmPassword = true;

  @override
  void dispose() {
    fullNameController.dispose();
    nicknameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    farmNameController.dispose();
    farmSizeController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (_currentStep < 2) {
      setState(() => _currentStep++);
    } else {
      store.customerName = fullNameController.text.trim().isNotEmpty
          ? fullNameController.text.trim()
          : 'Farmer Juan';

      Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (_) => const AppShell(role: 'Magsasaka'),
  ),
);
    }
  }

  void _prevStep() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7EF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F7EF),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: ink),
          onPressed: _prevStep,
        ),
        title: const Text(
          'Pagpaparehistro',
          style: TextStyle(
            color: forest,
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildProgressHeader(),

            Expanded(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.fromLTRB(18, 12, 18, 30),
                child: [
                  _buildStep1Fields(),
                  _buildStep2Fields(),
                  _buildStep3Fields(),
                ][_currentStep],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressHeader() {
    final titles = [
      'Personal na Impormasyon',
      'Profile ng Sakahan',
      'Beripikasyon',
    ];

    return Container(
      margin: const EdgeInsets.fromLTRB(18, 4, 18, 8),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: forest,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              CircleAvatar(
                radius: 23,
                backgroundColor: Colors.white24,
                child: Icon(
                  Icons.agriculture,
                  color: Colors.white,
                  size: 27,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mabuhay, Magsasaka!',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Irehistro ang iyong sarili at ang iyong sakahan.',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            'Hakbang ${_currentStep + 1} sa 3',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 9),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: (_currentStep + 1) / 3,
              backgroundColor: Colors.white24,
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFFA8D66D),
              ),
              minHeight: 7,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            titles[_currentStep],
            style: const TextStyle(
              color: Color(0xFFDCECCB),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStep1Fields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _sectionTitle(
          'Iyong Impormasyon',
          'Ilagay ang iyong personal na detalye.',
          Icons.person_outline,
        ),
        _buildCard(
          children: [
            _buildTextField(
              'Buong Pangalan',
              'Hal. Juan Dela Cruz',
              fullNameController,
              Icons.person_outline,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              'Palayaw',
              'Hal. Juan',
              nicknameController,
              Icons.badge_outlined,
            ),
            const SizedBox(height: 16),

            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Numero ng Telepono',
                hintText: '+63 912 345 6789',
                prefixIcon: Icon(Icons.phone_outlined),
              ),
            ),
            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('OTP verification is not connected yet.'),
                    ),
                  );
                },
                icon: const Icon(Icons.verified_outlined),
                label: const Text('I-verify ang Numero'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: forest,
                  side: const BorderSide(color: leaf),
                  padding: const EdgeInsets.symmetric(vertical: 13),
                ),
              ),
            ),
            const SizedBox(height: 16),

            DropdownButtonFormField<String>(
              value: selectedBarangay,
              isExpanded: true,
              decoration: const InputDecoration(
                labelText: 'Barangay',
                prefixIcon: Icon(Icons.location_on_outlined),
              ),
              items: barangays.map((barangay) {
                return DropdownMenuItem(
                  value: barangay,
                  child: Text(
                    barangay,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() => selectedBarangay = value);
              },
            ),
            const SizedBox(height: 16),

            DropdownButtonFormField<String>(
              value: selectedMunicipality,
              isExpanded: true,
              decoration: const InputDecoration(
                labelText: 'Lungsod o Munisipyo',
                prefixIcon: Icon(Icons.location_city_outlined),
              ),
              items: municipalities.map((municipality) {
                return DropdownMenuItem(
                  value: municipality,
                  child: Text(
                    municipality,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() => selectedMunicipality = value);
              },
            ),
          ],
        ),

        const SizedBox(height: 20),

        _sectionTitle(
          'Tungkol sa Iyong Sakahan',
          'Ibahagi ang pangunahing impormasyon tungkol sa iyong pananim.',
          Icons.grass,
        ),
        _buildCard(
          children: [
            _buildTextField(
              'Laki ng Sakahan',
              'Hal. 1 hectare',
              farmSizeController,
              Icons.landscape_outlined,
            ),
            const SizedBox(height: 18),
            const Text(
              'Ano ang iyong mga itinatanim?',
              style: TextStyle(
                color: ink,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Pumili ng isa o higit pang pananim.',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: cropsList.map((crop) {
                final isSelected = selectedCrops.contains(crop);

                return ChoiceChip(
                  label: Text(crop),
                  selected: isSelected,
                  selectedColor: forest,
                  backgroundColor: const Color(0xFFEAF1E2),
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : ink,
                    fontWeight: FontWeight.w600,
                  ),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        selectedCrops.add(crop);
                      } else {
                        selectedCrops.remove(crop);
                      }
                    });
                  },
                );
              }).toList(),
            ),
          ],
        ),

        const SizedBox(height: 20),

        _sectionTitle(
          'Security',
          'Gumawa ng password para sa iyong account.',
          Icons.lock_outline,
        ),
        _buildCard(
          children: [
            TextField(
              controller: passwordController,
              obscureText: hidePassword,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() => hidePassword = !hidePassword);
                  },
                  icon: Icon(
                    hidePassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: confirmPasswordController,
              obscureText: hideConfirmPassword,
              decoration: InputDecoration(
                labelText: 'Kumpirmahin ang Password',
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      hideConfirmPassword = !hideConfirmPassword;
                    });
                  },
                  icon: Icon(
                    hideConfirmPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

_primaryButton('Magpatuloy', _nextStep),

const SizedBox(height: 18),

Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    const Text(
      'May account ka na?',
      style: TextStyle(
        color: Colors.black54,
        fontSize: 13,
      ),
    ),
    TextButton(
  onPressed: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const SignInScreen(),
      ),
    );
  },
  child: const Text(
    'Mag-login',
    style: TextStyle(
      color: forest,
      fontWeight: FontWeight.bold,
    ),
  ),
),
  ],
),
      ],
    );
  }

  Widget _buildStep2Fields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _sectionTitle(
          'Profile ng Iyong Sakahan',
          'Ipakilala ang iyong bukid at ang iyong karanasan bilang magsasaka.',
          Icons.agriculture,
        ),

        _buildCard(
          children: [
            Center(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Image picker is not connected yet.'),
                        ),
                      );
                    },
                    child: Container(
                      width: 112,
                      height: 112,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAF1E2),
                        shape: BoxShape.circle,
                        border: Border.all(color: leaf, width: 2),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_a_photo_outlined,
                            size: 34,
                            color: forest,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Maglagay ng Litrato',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10,
                              color: forest,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Mag-upload ng litrato ng iyong sarili o ng iyong sakahan.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            _buildTextField(
              'Pangalan ng Sakahan',
              'Hal. Santos Family Farm',
              farmNameController,
              Icons.grass,
            ),
            const SizedBox(height: 18),

            const Text(
              'Lokasyon ng Sakahan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: ink,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),

            Container(
              height: 145,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFEAF1E2),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: leaf.withOpacity(0.5)),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Icon(
                    Icons.map_outlined,
                    color: Color(0xFF9BB68A),
                    size: 75,
                  ),
                  const Icon(
                    Icons.location_pin,
                    color: Colors.red,
                    size: 38,
                  ),
                  Positioned(
                    bottom: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 13,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Ilagay ang lokasyon sa mapa',
                        style: TextStyle(
                          fontSize: 11,
                          color: forest,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),

            DropdownButtonFormField<String>(
              value: selectedExperience,
              isExpanded: true,
              decoration: const InputDecoration(
                labelText: 'Tagal ng Karanasan sa Pagsasaka',
                prefixIcon: Icon(Icons.calendar_month_outlined),
              ),
              items: experienceYears.map((experience) {
                return DropdownMenuItem(
                  value: experience,
                  child: Text(experience),
                );
              }).toList(),
              onChanged: (value) {
                setState(() => selectedExperience = value);
              },
            ),
          ],
        ),

        const SizedBox(height: 24),
        _primaryButton('Magpatuloy', _nextStep),
        const SizedBox(height: 10),
        _secondaryButton('Bumalik', _prevStep),
      ],
    );
  }

  Widget _buildStep3Fields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _sectionTitle(
          'Beripikasyon ng Magsasaka',
          'Ihanda ang mga dokumentong kailangan para sa verification.',
          Icons.verified_user_outlined,
        ),

        _buildCard(
          children: [
            const Icon(
              Icons.assignment_ind_outlined,
              color: forest,
              size: 42,
            ),
            const SizedBox(height: 10),
            const Text(
              'Mga Kailangang Dokumento',
              style: TextStyle(
                color: ink,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Siguraduhing malinaw at nababasa ang mga larawan ng iyong dokumento.',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 20),

            _buildUploadCard(
              'Valid ID',
              'Mag-upload ng malinaw na larawan ng iyong valid ID.',
            ),
            const SizedBox(height: 14),
            _buildUploadCard(
              'Barangay Certificate',
              'Mag-upload ng sertipiko mula sa inyong barangay.',
            ),
            const SizedBox(height: 14),
            _buildUploadCard(
              'Selfie kasama ang ID',
              'Mag-upload ng selfie habang hawak ang iyong ID.',
            ),
          ],
        ),

        const SizedBox(height: 15),
        const Text(
          'Ang verification ay hindi pa konektado sa isang aktuwal na review system.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 11,
          ),
        ),
        const SizedBox(height: 22),

        _primaryButton('Isumite ang Registration', _nextStep),
        const SizedBox(height: 10),
        _secondaryButton('Bumalik', _prevStep),
      ],
    );
  }

  Widget _sectionTitle(
    String title,
    String subtitle,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFE3EDD8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: forest, size: 23),
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: forest,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard({required List<Widget> children}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE4EBDD)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.035),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }

  Widget _buildTextField(
    String label,
    String hint,
    TextEditingController controller,
    IconData icon,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
      ),
    );
  }

  Widget _buildUploadCard(String title, String subtitle) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F7EF),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFDCE8D1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.description_outlined,
                color: forest,
                size: 22,
              ),
              const SizedBox(width: 9),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: ink,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 11,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$title upload is not connected yet.'),
                  ),
                );
              },
              icon: const Icon(Icons.camera_alt_outlined, size: 18),
              label: const Text('Mag-upload ng Larawan'),
              style: OutlinedButton.styleFrom(
                foregroundColor: forest,
                side: const BorderSide(color: leaf),
                padding: const EdgeInsets.symmetric(vertical: 11),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _primaryButton(String text, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: forest,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget _secondaryButton(String text, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: forest,
          side: const BorderSide(color: leaf),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
