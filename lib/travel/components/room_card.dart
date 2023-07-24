import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
            imageUrl:
                "https://sb.ecobnb.net/app/uploads/sites/3/2021/09/Progetto-senza-titolo-5.jpg.webp"),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Delxue Twin",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
                Text("Twin Single Beds, Cable TV,Free Wifi")
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(color: Colors.red)),
              child: const Center(
                child: Text(
                  "View Rates",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 22,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Avg. Nightly/ Room From"),
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
        )
      ],
    );
  }
}
