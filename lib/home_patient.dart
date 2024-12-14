import 'package:flutter/material.dart';
import 'login_page.dart';
import 'ordonnance.dart';

class HomePatientPage extends StatelessWidget {
  const HomePatientPage({Key? key}) : super(key: key);

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
                  MaterialPageRoute(
                      builder: (context) =>
                          LoginPage()), // Navigate to login page
                );
              } else {
                // Handle other menu options here (e.g., navigation)
                print('$value selected');
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'Accueil',
                  child: Row(
                    children: [
                      Icon(Icons.home, color: Color(0xFF24C866)), // Home icon
                      SizedBox(width: 10),
                      Text(
                        'Accueil',
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
                PopupMenuItem<String>(
                  value: 'Suivi des commandes',
                  child: Row(
                    children: [
                      Icon(Icons.shopping_cart,
                          color: Color(0xFF24C866)), // Cart icon
                      SizedBox(width: 10),
                      Text(
                        'Suivi des commandes',
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
                PopupMenuItem<String>(
                  value: 'Listes des pharmacies',
                  child: Row(
                    children: [
                      Icon(Icons.local_pharmacy,
                          color: Color(0xFF24C866)), // Pharmacy icon
                      SizedBox(width: 10),
                      Text(
                        'Listes des pharmacies',
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
                PopupMenuItem<String>(
                  value: 'Deconnecter',
                  child: Row(
                    children: [
                      Icon(Icons.exit_to_app,
                          color: Color(0xFF24C866)), // Logout icon
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
              borderRadius:
                  BorderRadius.circular(10), // Rounded corners for the menu
            ),
            color: Colors.white, // Set background color for the menu
            elevation: 5, // Shadow effect
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
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
                          hintText: 'Que cherchez-vous?',
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

              // Welcome Message
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xCE24C866),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Bonjour Oumaima',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Bienvenue dans votre pharmacie en ligne!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Image.asset('assets/pharmacypic.png',
                        height: 70, width: 70),
                  ],
                ),
              ),

              // Category Boxes
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _CategoryBox(
                    icon: 'assets/commande.png',
                    label: 'Suivi des commandes',
                  ),
                  _CategoryBox(
                    icon: 'assets/pharmacie.png',
                    label: 'Carte des pharmacies',
                  ),
                  _CategoryBox(
                    icon: 'assets/accueil.png',
                    label: 'Accueil',
                  ),
                ],
              ),

              // Pharmacies Section
              const SizedBox(height: 20),
              const Text(
                'Trouver une Pharmacie',
                style: TextStyle(
                  color: Color.fromRGBO(50, 50, 75, 0.99),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 130,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                      10,
                      (index) => InkWell(
                            onTap: () {
                              // Handle pharmacy selection
                              print('Pharmacy $index selected');
                              // You can navigate to another page or show details here
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal:
                                      8.0), // Adds padding around each box
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Optional: for rounded corners
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black
                                          .withOpacity(0.1), // Shadow color
                                      spreadRadius:
                                          1, // How much the shadow spreads
                                      blurRadius: 8, // How blurry the shadow is
                                      offset: Offset(
                                          0, 4), // Position of the shadow
                                    ),
                                  ],
                                ),
                                child:
                                    _PharmacyBox(), // Your original pharmacy box widget
                              ),
                            ),
                          )),
                ),
              ),

              /// Submit Button
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF24C866),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // Navigate to Ordonnance.dart when the button is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OrdonnancePage()),
                    );
                  },
                  child: const Text(
                    'Soumettre une ordonnance',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
              // Orders Section
              const SizedBox(height: 20),
              const Text(
                'Mes commandes',
                style: TextStyle(
                  color: Color.fromRGBO(50, 50, 75, 0.99),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: List.generate(
                    5,
                    (index) => Container(
                          width: double
                              .infinity, // Makes the box span the full width
                          child: _OrderBox(),
                        )),
              ),
            ],
          ),
        ),
      ),

      // Footer
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
}

class _CategoryBox extends StatelessWidget {
  final String icon;
  final String label;

  const _CategoryBox({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F0F0),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFFF1F0F0)),
          ),
          child: Image.asset(icon, height: 50, width: 50),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF24C866),
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _PharmacyBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF24C866)),
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
          Text(
            'Pharmacie Al Yossr',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Adresse: Adresse exemple',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Poppins',
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Contact: +212645789626',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}

class _OrderBox extends StatelessWidget {
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
          Text(
            'Commande #0001',
            style: TextStyle(
              color: Color(0xFF24C866),
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Pharmacie: Pharmacie Al Yossr',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Poppins',
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Contact: +212645789626',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Poppins',
            ),
          ),
          SizedBox(height: 8),
          Text(
            'En préparation',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
