import 'package:flutter/material.dart';
import 'home_patient.dart';
import 'home_pharmacien.dart'; 
import 'role_selection_page.dart'; // Import the RoleSelectionPage

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final Map<String, Map<String, String>> _users = {
  'oumaima': {'password': '123', 'role': 'patient'},
  'ismail': {'password': '123', 'role': 'pharmacien'},
};
void _login() {
  final email = _emailController.text;
  final password = _passwordController.text;

  if (email == 'oumaima' && password == '123') {
    // Navigate to the HomePatient page if the user is "oumaima"
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePatientPage()),
    );
  } else if (email == 'ismail' && password == '123') {
    // Navigate to the HomePharmacien page if the user is "ismail"
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  PharmacistHomePage()),
    );
  } else {
    // Show an error message if credentials are incorrect
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Email ou mot de passe incorrect'),
        backgroundColor: Colors.red,
      ),
    );
  }
}
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
              controller: _emailController,
              label: 'Email ou numéro de téléphone',
              iconPath: 'assets/email.png',
              obscureText: false,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              controller: _passwordController,
              label: 'Mot de passe',
              iconPath: 'assets/motdepasse.png',
              obscureText: true,
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: _login,
              child: _buildLoginButton(),
            ),
            const SizedBox(height: 20),
            _buildNoAccountText(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
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
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(
          fontSize: 14,
          color: Color(0x40000000),
        ),
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Image.asset(iconPath, width: 20, height: 20),
          labelStyle: const TextStyle(
            color: Color(0xFF4A4A4A),
            fontFamily: 'Poppins',
            fontSize: 14,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      width: 200,
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RoleSelectionPage()),
        );
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