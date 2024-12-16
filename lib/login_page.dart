import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'dart:convert'; // Pour gérer JSON
import 'admin.dart';
import 'home_patient.dart';
import 'home_pharmacien.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  String? errorMessage; // Message d'erreur
  String? successMessage; // Message de succès

  // Fonction pour gérer le login
  Future<void> handleLogin() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
      successMessage = null;
    });

    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        isLoading = false;
        errorMessage = "Veuillez remplir tous les champs.";
      });
      return;
    }

    try {
      // Remplacez par votre URL API
      const apiUrl = 'http://10.0.2.2:8080/demo-1.0-SNAPSHOT/api/auth/login';

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body); // Décoder la réponse JSON
        print("Réponse complète : $data");

        if (data['message'] == "Login successful" && data['data'] != null) {
          // Connexion réussie
          final token = data['data']; // Le token JWT
          // print("Token JWT : $token");

          // Enregistrer le token dans les SharedPreferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('jwt_token', token);

          // Naviguer vers la page appropriée
          navigateBasedOnRole(token);
        } else {
          setState(() {
            errorMessage = "Réponse inattendue de l'API.";
          });
        }
      } else {
        setState(() {
          errorMessage = "Erreur ${response.statusCode} : ${response.reasonPhrase}";
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = "Erreur de connexion : $e";
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  // Fonction pour naviguer en fonction du rôle de l'utilisateur
  Future<void> navigateBasedOnRole(String token) async {
    try {
      // Décoder le token
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      print("Les données de notre token : $decodedToken");
      // 🔥 Vérifiez le champ correct ici (username, sub, name)
      String extractedUsername = decodedToken['sub'] ?? decodedToken['sub'] ?? decodedToken['name'] ?? 'Utilisateur';

      // ➡️ Stocker dans l'état de la page
      setState(() {
        var username = extractedUsername;
      });

      // ✅ Stocker dans SharedPreferences pour l'utiliser dans d'autres pages
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', extractedUsername);
      print("le Nom  l'utilisateur : $extractedUsername");

      String role = decodedToken['role'] ?? 'user';
      print("Rôle de l'utilisateur : $role");

      Widget page;
      if (role == 'ADMIN') {
        page = const AdminHomePage();
      } else if (role == 'PATIENT') {
        page = const HomePatientPage();
      } else if (role == 'PHARMACY') {
        page = const PharmacistHomePage();
      } else {
        setState(() {
          errorMessage = "Rôle inconnu. Impossible de naviguer.";
        });
        return;
      }

      setState(() {
        successMessage = "Connexion réussie. Bienvenue !";
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    } catch (error) {
      setState(() {
        errorMessage = "Erreur lors de la décodification du token : $error";
      });
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
            const SizedBox(height: 20),
            const Text(
              'Connexion à votre compte',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF24C866),
              ),
            ),
            const SizedBox(height: 30),
            _buildTextField(
              label: 'Email',
              iconPath: 'assets/email.png',
              obscureText: false,
              controller: emailController,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              label: 'Mot de passe',
              iconPath: 'assets/motdepasse.png',
              obscureText: true,
              controller: passwordController,
            ),
            const SizedBox(height: 20),
            if (errorMessage != null)
              Text(
                errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            if (successMessage != null)
              Text(
                successMessage!,
                style: const TextStyle(color: Colors.green),
              ),
            const SizedBox(height: 20),
            isLoading
                ? const CircularProgressIndicator()
                : GestureDetector(
              onTap: handleLogin,
              child: _buildLoginButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String iconPath,
    required bool obscureText,
    required TextEditingController controller,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(33),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          icon: Image.asset(iconPath, width: 20, height: 20),
          labelText: label,
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF24C866),
        borderRadius: BorderRadius.circular(33),
      ),
      child: const Center(
        child: Text(
          'Se connecter',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}