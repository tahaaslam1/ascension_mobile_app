import 'package:flutter/material.dart';

class ViewBidingScreen extends StatelessWidget {
  static const route = 'view-biding-screen';
  const ViewBidingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("All Bids"),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
              ),
              Column(
                children: const [
                  Text(" Hunain Arif"),
                  Text("Nov 15, 2021 at 7:00"),
                ],
              ),
              const Text("2.54 ETH"),
            ],
          )
        ],
      ),
    );
  }
}
