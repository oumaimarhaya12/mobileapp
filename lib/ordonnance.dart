import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_patient.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class OrdonnancePage extends StatefulWidget {
  @override
  _OrdonnancePageState createState() => _OrdonnancePageState();
}

class _OrdonnancePageState extends State<OrdonnancePage> {
  File? _image;

  // Function to pick image from gallery
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (image != null) {
        _image = File(image.path);
      }
    });
  }
  // Function to capture image using camera
  Future<void> _takePicture() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (image != null) {
        _image = File(image.path);
      }
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
          PopupMenuButton<String>(
  onSelected: (String value) {
    if (value == 'Accueil') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePatientPage()),
      );
    } else if (value == 'Deconnecter') {
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
        child: Row(
          children: [
            Icon(Icons.home, color: Color(0xFF24C866)),
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
              // Header
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
                            'Soumettre une ordonnance',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Prenez ou téléchargez une image de votre ordonnance.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Image Section
const SizedBox(height: 20),
Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _image == null
          ? const Text(
              'Aucune image sélectionnée',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontFamily: 'Poppins',
              ),
            )
          : Container(
              width: 650, // Adjust the width
              height: 650, // Adjust the height
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey, width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.file(
                  _image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
    ],
  ),
),

// Supported Formats Information
const SizedBox(height: 20),
Center(
  child: Column(
    children: [
      Image.asset(
        'assets/upload.png', // Path to your upload image
        height: 120, // Increased size
        width: 120, // Increased size
      ),
      const SizedBox(height: 10),
      const Text(
        'Formats supportés : JPG, PNG',
        textAlign: TextAlign.center, // Center text
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: 'Poppins',
          color: Colors.grey,
        ),
      ),
    ],
  ),
),
              // Button to pick image from gallery
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
                  onPressed: _pickImage,
                  child: const Text(
                    'Choisir une image',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),

              // Button to take a picture using camera
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
                  onPressed: _takePicture,
                  child: const Text(
                    'Prendre une photo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
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
}