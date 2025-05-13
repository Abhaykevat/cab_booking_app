import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RideSheetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(12.9716, 77.5946), // Bengaluru
              zoom: 14,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.2,
            maxChildSize: 0.95,
            builder: (context, scrollController) {
              return RideBottomSheet(scrollController: scrollController);
            },
          ),
        ],
      ),
    );
  }
}

class RideBottomSheet extends StatefulWidget {
  final ScrollController scrollController;

  RideBottomSheet({required this.scrollController});

  @override
  _RideBottomSheetState createState() => _RideBottomSheetState();
}

class _RideBottomSheetState extends State<RideBottomSheet> {
  int selectedIndex = 0;
  int selectedPaymentIndex = 0;

  final List<Map<String, dynamic>> rides = [
    {
      "type": "Taxita Regular",
      "time": "10.24am",
      "duration": "2 min",
      "price": "\$23.87",
      "image": "assets/images/bike.png",
      "cheaper": true,
    },
    {
      "type": "Taxita Medium",
      "time": "10.24am",
      "duration": "2 min",
      "price": "\$25.00",
      "image": "assets/images/car.png",
      "cheaper": false,
    },
    {
      "type": "Taxita Exclusive",
      "time": "10.24am",
      "duration": "2 min",
      "price": "\$27.49",
      "image": "assets/images/auto.png",
      "cheaper": false,
    },
  ];

  final List<Map<String, dynamic>> paymentMethods = [
    {
      "image": "assets/images/visa.png",
      "label": "**** **** **** 8970",
      "subLabel": "Expires: 12/26",
    },
    {
      "image": "assets/images/wallet.png",
      "label": "My Wallet",
      "subLabel": "\$349",
    },
    {
      "image": "assets/images/cash.png",
      "label": "Cash",
    },
    {
      "image": "assets/images/gpay.png",
      "label": "Google Pay",
    },
    {
      "image": "assets/images/phonepe.png",
      "label": "Phone Pay",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: ListView(
        controller: widget.scrollController,
        children: [
          // Ride Selection Section
          Text(
            "Select Ride",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ...rides.asMap().entries.map((entry) {
            int index = entry.key;
            var ride = entry.value;
            final isSelected = index == selectedIndex;

            return GestureDetector(
              onTap: () => setState(() => selectedIndex = index),
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isSelected ? Colors.green : Colors.grey.shade300,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          ride["image"],
                          width: 40,
                          height: 40,
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ride["type"],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "${ride["time"]} • ${ride["duration"]}",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          ride["price"],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  if (ride["cheaper"] == true)
                    Positioned(
                      top: 10,
                      right: 2,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Cheaper",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            );
          }).toList(),

          SizedBox(height: 16),
          Divider(),
          SizedBox(height: 8),

          // Payment Method Section
          Text(
            "Select payment method",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            "Select payment method you want to use",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 12),

          ...paymentMethods.asMap().entries.map((entry) {
            int index = entry.key;
            var method = entry.value;
            final isSelected = index == selectedPaymentIndex;

            return GestureDetector(
              onTap: () => setState(() => selectedPaymentIndex = index),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 6),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected ? Colors.blue : Colors.grey.shade300,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    if (method["image"] != null &&
                        (method["image"] as String).isNotEmpty)
                      Image.asset(
                        method["image"],
                        width: 28,
                        height: 28,
                      )
                    else
                      Icon(Icons.account_balance_wallet, size: 28),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            method["label"],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          if (method["subLabel"] != null)
                            Text(
                              method["subLabel"],
                              style: TextStyle(color: Colors.grey),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
