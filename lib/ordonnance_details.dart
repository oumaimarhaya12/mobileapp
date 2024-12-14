import 'package:flutter/material.dart';

class OrdonnanceDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset('assets/logoo.png', height: 40, width: 40),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Color(0xFF24C866)),
            onPressed: () {
              // Handle notifications
            },
          ),
          PopupMenuButton<String>(
            onSelected: (String value) {
              print('$value selected');
              // Handle menu options here
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'Accueil',
                  child: _menuItem('Accueil', Icons.home),
                ),
                PopupMenuItem<String>(
                  value: 'Déconnecter',
                  child: _menuItem('Déconnecter', Icons.exit_to_app),
                ),
              ];
            },
            icon: Image.asset('assets/menu.png', height: 40, width: 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.white,
            elevation: 5,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: const Text(
                  "Les détails de l'ordonnance s'afficheront ici.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Poppins',
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle Télécharger
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      side: const BorderSide(color: Color(0xFF24C866), width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Télécharger',
                      style: TextStyle(
                        color: Color(0xFF24C866),
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle Valider
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF24C866),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Valider',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF24C866),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/searchwhite.png', height: 40, width: 40),
              Image.asset('assets/commandewhite.png', height: 40, width: 40),
              Image.asset('assets/pharmaciewhite.png', height: 40, width: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuItem(String label, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Color(0xFF24C866)),
        const SizedBox(width: 10),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF24C866),
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}