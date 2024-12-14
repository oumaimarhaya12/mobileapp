import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CreateAccountPharmacien(),
    );
  }
}

class CreateAccountPharmacien extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccountPharmacien> {
  // Controllers for each input field to handle user input
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _pharmacyNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers when no longer needed to avoid memory leaks
    _fullNameController.dispose();
    _pharmacyNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo Icon
              Icon(
                Icons.health_and_safety,
                color: Color(0xFF24C866), // Updated color
                size: 50,
              ),
              const SizedBox(height: 16),

              // Form Card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xFF24C866)), // Updated color
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Title
                    Text(
                      "Entrez vos informations",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF24C866), // Updated color
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Input Fields
                    _buildInputField("Nom complet", _fullNameController),
                    _buildInputField("Nom de pharmacie", _pharmacyNameController), // Added field for pharmacy name
                    _buildInputField("Adresse email", _emailController),
                    _buildInputField("Numéro de téléphone", _phoneController),
                    _buildInputField("Adresse", _addressController),
                    _buildInputField("Mot de passe", _passwordController, obscureText: true),

                    const SizedBox(height: 20),

                    // Submit Button
                    ElevatedButton(
                      onPressed: () {
                        // Handle account creation
                        print("Account Created with: ${_fullNameController.text}");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF24C866), // Updated color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                        child: Text(
                          "Créer un compte",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Decorative Illustration
              Expanded(
                child: Image.asset(
                  'assets/pic1.png',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Updated _buildInputField with controller parameter
  Widget _buildInputField(String label, TextEditingController controller, {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }
}
