import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF003E2D),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/avatarman.png'),
                              ),
                              const SizedBox(width: 10),
                              Text("Desirae Levin",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16, color: Colors.white)),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.cloudy_snowing,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 5),
                              Text("25°C",
                                  style: TextStyle(color: Colors.white))
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      Padding(
                        padding: const EdgeInsets.only(right: 90.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Hi Emery,",
                                style:
                                    GoogleFonts.poppins(color: Colors.white70)),
                            Text("Where do you will go?",
                                style: GoogleFonts.poppins(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey), // Outline border
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const TextField(
                              decoration: InputDecoration(
                                hintText: 'Pick up location',
                                hintStyle: TextStyle(color: Colors.grey),
                                prefixIcon:
                                    Icon(Icons.my_location, color: Colors.blue),
                                filled: true,
                                fillColor:
                                    Color(0xFFE3F2FD), // light blue background
                                enabledBorder: OutlineInputBorder(
                                  // borderSide: BorderSide(color: Colors.blue),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  // borderSide: BorderSide(
                                  //     color: Colors.blueAccent, width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            const TextField(
                              decoration: InputDecoration(
                                hintText: 'Drop-off location',
                                hintStyle: TextStyle(color: Colors.grey),
                                prefixIcon:
                                    Icon(Icons.location_on, color: Colors.red),
                                filled: true,
                                fillColor:
                                    Color(0xFFFFEBEE), // light red background
                                enabledBorder: OutlineInputBorder(
                                  // borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  // borderSide: BorderSide(
                                  //     color: Colors.redAccent, width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.greenAccent,
                                ),
                                onPressed: () {},
                                child: const Text("Find drivers"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                          height: 150,
                          child: GoogleMap(
                            initialCameraPosition: CameraPosition(
                              target: LatLng(
                                  12.9716, 77.5946), // Example: Bengaluru
                              zoom: 14,
                            ),
                            myLocationEnabled: true,
                            myLocationButtonEnabled: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.check_circle, color: Colors.green),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Discount SafeTrip+ activated for \$10\nUp to \$5 vouchers for pickup delays.",
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color(0xFF00251A),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard), label: 'Coupons'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
