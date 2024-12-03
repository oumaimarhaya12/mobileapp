import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/pic1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Entrez vos informations pour continuer',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF24C866),
                fontFamily: 'Poppins',
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 40),
            _buildTextField(
              label: 'Email ou numéro de téléphone',
              iconPath: 'assets/email.png',
              obscureText: false,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              label: 'Mot de passe',
              iconPath: 'assets/motdepasse.png',
              obscureText: true,
            ),
            const SizedBox(height: 30),
            _buildLoginButton(),
            const SizedBox(height: 20),
            _buildNoAccountText(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String iconPath,
    required bool obscureText,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(33),
        border: Border.all(color: const Color.fromRGBO(0, 0, 0, 1), width: 2),
        color: Colors.transparent,
      ),
      child: TextField(
        obscureText: obscureText,
        style: const TextStyle(
          fontSize: 14, // Make text smaller
          color: Color(0x40000000), // Light gray text
        ),
        decoration: InputDecoration(
          labelText: label,
          prefixIcon:
              Image.asset(iconPath, width: 20, height: 20), // Smaller icon
          labelStyle: const TextStyle(
            color: Color(0xFF4A4A4A), // Dark gray color for labels
            fontFamily: 'Poppins',
            fontSize: 14, // Make label text smaller
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      width: 200, // Reduced width
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF24C866),
        borderRadius: BorderRadius.circular(33),
        boxShadow: const [
          BoxShadow(
            color: Color(0x40000000),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: const Text(
        'Se connecter',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Poppins',
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildNoAccountText(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to sign-up page (not implemented here)
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Vous n'avez pas de compte ? ",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'Créer un compte',
            style: TextStyle(
              color: Color(0xFF24C866),
              fontFamily: 'Poppins',
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
