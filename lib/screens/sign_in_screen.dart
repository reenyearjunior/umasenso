
import 'package:flutter/material.dart';
import '../app_shared.dart';
import 'app_shell.dart';
import 'onboarding_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final email = TextEditingController();
  final password = TextEditingController();

  bool hidePassword = true;

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  void signIn() {
    if (email.text.trim().isEmpty || password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Ilagay ang iyong email at password.'),
        ),
      );
      return;
    }

    store.email = email.text.trim();
    store.customerName = email.text.trim().split('@').first;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const AppShell(),
      ),
    );
  }

  void createAccount() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const RoleSelectionScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 24),

                Container(
                  height: 145,
                  decoration: BoxDecoration(
                    color: pale,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: const Center(
                    child: Text(
                      '🌱',
                      style: TextStyle(fontSize: 86),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                const Text(
                  'UMASENSO',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 29,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                    color: forest,
                  ),
                ),

                const Text(
                  'Mula Bukid, Diretso sa Merkado.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: leaf),
                ),

                const SizedBox(height: 34),

                const Text(
                  'Welcome back!',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: ink,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Mag-login upang makakonekta sa mga lokal na magsasaka.',
                ),

                const SizedBox(height: 22),

                TextField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email Address',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                ),

                const SizedBox(height: 14),

                TextField(
                  controller: password,
                  obscureText: hidePassword,
                  onSubmitted: (_) => signIn(),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                      icon: Icon(
                        hidePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Hindi pa konektado ang password recovery.',
                          ),
                        ),
                      );
                    },
                    child: const Text('Forgot Password?'),
                  ),
                ),

                const SizedBox(height: 8),

                FilledButton(
                  onPressed: signIn,
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Mag-login'),
                ),

                const SizedBox(height: 12),

                OutlinedButton(
                  onPressed: createAccount,
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Gumawa ng Account'),
                ),

                const SizedBox(height: 18),

                const Text(
                  'Prototype mode. Gumamit ng anumang email at password.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
