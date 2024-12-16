import 'package:flutter/material.dart';
import 'login_page.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key}) : super(key: key);

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
          PopupMenuButton<String>(
            onSelected: (String value) {
              if (value == 'Deconnecter') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'Deconnecter',
                  child: Row(
                    children: [
                      Icon(Icons.exit_to_app, color: Color(0xFF24C866)),
                      SizedBox(width: 10),
                      Text(
                        'Deconnecter',
                        style: TextStyle(
                          color: Color(0xFF24C866),
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
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
              // Barre de recherche
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFF1F0F0)),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Rechercher un patient ou une pharmacie',
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.44),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                    Image.asset('assets/search.png', height: 30, width: 30),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Liste des patients
              const Text(
                'Liste des Patients',
                style: TextStyle(
                  color: Color.fromRGBO(50, 50, 75, 0.99),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: List.generate(5, (index) => _PatientBox()),
              ),

              const SizedBox(height: 20),

              // Liste des pharmacies
              const Text(
                'Liste des Pharmacies',
                style: TextStyle(
                  color: Color.fromRGBO(50, 50, 75, 0.99),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: List.generate(5, (index) => _PharmacyAdminBox()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PatientBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black26),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Patient: Oumaima',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins')),
          Text('Contact: +212645789626',
              style: TextStyle(fontSize: 12, fontFamily: 'Poppins')),
        ],
      ),
    );
  }
}

class _PharmacyAdminBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black26),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Pharmacie: Pharmacie Al Yossr',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              Text('Contact: +212645789626',
                  style: TextStyle(fontSize: 12)),
            ],
          ),
          Switch(
            value: true,
            onChanged: (bool newValue) {
              // Changer le statut de la pharmacie (Actif/Inactif)
              print('Le statut de la pharmacie a changé en $newValue');
            },
            activeColor: Color(0xFF24C866),
          )
        ],
      ),
    );
  }
}