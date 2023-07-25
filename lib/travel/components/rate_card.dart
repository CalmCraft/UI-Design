import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'activity_tab.dart';

class RateCard extends StatelessWidget {
  const RateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "YOUR E-VOUCHER RATE",
                    ),
                    Expanded(
                      child: SizedBox(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Image.asset(
                            "assets/icons/nextred@2x.png",
                            height: 40,
                            width: 40,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const Text(
                  "Mobile App Special Voucher",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: ActivityTab(
                        imagePath: 'assets/icons/fnb@2x.png',
                        name: 'Inclusive of Breakfast',
                      ),
                    ),
                    const Expanded(
                      child: ActivityTab(
                        imagePath: 'assets/icons/discount@2x.png',
                        name: '20% off In-Room Service',
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(color: Colors.red)),
                        child: const Center(
                          child: Text(
                            "View Rates",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const Divider(
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Avg. Nightly/ Room From",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text("Subject to GST & Service charge")
                      ],
                    ),
                    RichText(
                      text: const TextSpan(
                          text: "SGD\t",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: "SansSemi"),
                          children: [
                            TextSpan(
                                text: "161.42",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "SansSemi"))
                          ]),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.yellow,
            ),
            child: const Center(
              child: Text(
                "MEMBERS DEALS",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
