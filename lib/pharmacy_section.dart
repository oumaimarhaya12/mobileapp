import 'package:flutter/material.dart';

class PharmacySection extends StatefulWidget {
  @override
  _PharmacySectionState createState() => _PharmacySectionState();
}

class _PharmacySectionState extends State<PharmacySection> {
  int _selectedPharmacyIndex = -1; // To track the selected pharmacy index

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          height: 160, // Increase height to accommodate all details
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6, // 6 pharmacies
            itemBuilder: (context, index) {
              bool isSelected = _selectedPharmacyIndex == index;
              return InkWell(
                onTap: () {
                  setState(() {
                    // Toggle selection
                    _selectedPharmacyIndex = isSelected ? -1 : index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: 160, // Adjust width as needed
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: const Color(0xFF24C866), // Border color
                        width: 1,
                      ),
                      color: Colors.white, // Background color
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: _PharmacyBox(
                      pharmacyName: 'Pharmacie Al Yossr', // Example name
                      address: 'Fadesse, Résidence Tafoukt', // Example address
                      contact: '+21245789636', // Example contact
                      isSelected: isSelected,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _PharmacyBox extends StatelessWidget {
  final String pharmacyName;
  final String address;
  final String contact;
  final bool isSelected;

  const _PharmacyBox({
    required this.pharmacyName,
    required this.address,
    required this.contact,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Pharmacy name
          Text(
            pharmacyName,
            style: TextStyle(
              color: const Color(0xFF24C866),
              fontFamily: 'Poppins',
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          // Address
          Text(
            'Adresse: $address',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontSize: 7,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 4),
          // Contact
          Text(
            'Contact: $contact',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontSize: 7,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}