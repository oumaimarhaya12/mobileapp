import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';
import 'ordonnance_details.dart';

class PharmacistHomePage extends StatefulWidget {
  const PharmacistHomePage({super.key});

  @override
  _PharmacistHomePageState createState() => _PharmacistHomePageState();
}

class _PharmacistHomePageState extends State<PharmacistHomePage> {
  bool isOrdonnancesSelected = true; // Default selection
  String username = '';

  @override
  void initState() {
    super.initState();
    loadUsername();
  }

  // ✅ Charger le nom d'utilisateur à partir de SharedPreferences
  Future<void> loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedUsername = prefs.getString('username');

    setState(() {
      username = savedUsername ?? 'Utilisateur';
    });
  }
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
              if (value == 'Déconnecter') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              } else {
                print('$value selected');
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'Accueil',
                  child: _menuItem('Accueil', Icons.home),
                ),
                PopupMenuItem<String>(
                  value: 'Ordonnances reçues',
                  child: _menuItem('Ordonnances reçues', Icons.description),
                ),
                PopupMenuItem<String>(
                  value: 'Historique',
                  child: _menuItem('Historique', Icons.history),
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
              _searchBar(),
              const SizedBox(height: 20),
              _welcomeMessage(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _CategoryBox(
                    icon: 'assets/commande.png',
                    label: 'Ordonnances',
                  ),
                  _CategoryBox(
                    icon: 'assets/pharmacie.png',
                    label: 'Historique',
                  ),
                  _CategoryBox(
                    icon: 'assets/accueil.png',
                    label: 'Accueil',
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _actionButton(
                    label: 'Ordonnances',
                    isSelected: isOrdonnancesSelected,
                    onTap: () {
                      setState(() {
                        isOrdonnancesSelected = true;
                      });
                    },
                  ),
                  _actionButton(
                    label: 'Historique',
                    isSelected: !isOrdonnancesSelected,
                    onTap: () {
                      setState(() {
                        isOrdonnancesSelected = false;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              isOrdonnancesSelected ? _orderBoxes() : _historyBoxes(),
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

  Widget _searchBar() {
    return Container(
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
    );
  }

  Widget _welcomeMessage() {
    return Container(
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
              children:  [
                Text(
                  'Bonjour $username',
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
          Image.asset('assets/pharmacypic.png', height: 70, width: 70),
        ],
      ),
    );
  }

  Widget _CategoryBox({required String icon, required String label}) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: const Color.fromRGBO(45, 45, 72, 0.2)),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Image.asset(icon, height: 40, width: 40),
        ),
        const SizedBox(height: 8),
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

  Widget _actionButton(
      {required String label,
        required bool isSelected,
        required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF24C866) : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          border: isSelected
              ? null
              : Border.all(color: const Color(0xFF24C866), width: 2),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFF24C866),
            fontFamily: 'Poppins',
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _orderBoxes() {
    return Column(
      children: List.generate(3, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: const Color.fromRGBO(45, 45, 72, 0.2)),
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
            children: [
              Text(
                'Commande #000${index + 1}',
                style: const TextStyle(
                  color: Color(0xFF24C866),
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Patient: Oumaima Rhaya\nDate et heure: 12/12/2024 - 20:14',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    // Navigate to OrdonnanceDetailsPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrdonnanceDetailsPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Voir les détails',
                    style: TextStyle(
                      color: Color(0xFF24C866),
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
  Widget _historyBoxes() {
    return Column(
      children: List.generate(3, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: const Color.fromRGBO(45, 45, 72, 0.2)),
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
            children: [
              Text(
                'Commande #000${index + 1}',
                style: const TextStyle(
                  color: Color(0xFF24C866),
                  fontFamily: 'Poppins',
                  fontSize: 16, // Increased from 10
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8), // Increased from 5
              const Text(
                'Patient: Oumaima Rhaya\nDate et heure: 12/12/2024 - 20:14',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontSize: 14, // Increased from 8
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 12), // Increased from 10
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    // View details action
                  },
                  child: const Text(
                    'Préte à récupérer',
                    style: TextStyle(
                      color: Color(0xFF24C866),
                      fontFamily: 'Poppins',
                      fontSize: 14, // Increased from 10
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}