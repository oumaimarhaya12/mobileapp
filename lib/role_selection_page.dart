import 'package:flutter/material.dart';
import 'login_page.dart';
import 'create_account.dart'; // Import the create_account page
import 'create_account_pharmacien.dart'; // Import the create_account_pharmacien page

class RoleSelectionPage extends StatelessWidget {
  const RoleSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Image and Text at the center
          Expanded(
            flex: 2,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/pic1.png', // Replace with your image path
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Est-ce que vous êtes?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF24C866), // Updated color
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to CreateAccountPharmacienPage when "Pharmacien" is selected
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateAccountPharmacien(), // Navigate to the CreateAccountPharmacien page
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                          side: const BorderSide(color: Color(0xFF24C866)), // Updated color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Pharmacien',
                          style: TextStyle(color: Color(0xFF24C866)), // Updated color
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to CreateAccountPage when "Patient" is selected
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateAccount(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF24C866), // Updated color
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Patient',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Back with icon
          Padding(
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Image.asset(
                  'assets/back.png', // Replace with your icon path
                  width: 30, // Adjust size as needed
                  height: 30,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
