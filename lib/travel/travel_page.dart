import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TravelPage extends StatelessWidget {
  const TravelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Image.asset(
              "assets/icons/currency@2x.png",
              height: 35,
              width: 35,
            ),
            const SizedBox(
              width: 12,
            ),
            Image.asset(
              "assets/icons/chatactive@2x.png",
              height: 35,
              width: 35,
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Expanded(
                        flex: 3,
                        child: Text(
                          "Furama Riverfront, Singapore",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
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
                  Row(
                    children: [
                      const Expanded(
                        flex: 3,
                        child: Text(
                          "405 Havelock Road, Singapore 169633",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Image.asset(
                              "assets/icons/currentlocation@2x.png",
                              height: 35,
                              width: 35,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: CarouselSlider(
                items: List.generate(
                  3,
                  (index) => CachedNetworkImage(
                    imageUrl:
                        "https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80",
                    height: 150,
                    fit: BoxFit.fill,
                  ),
                ),
                options: CarouselOptions(
                  viewportFraction: 0.85,
                  autoPlay: true,
                ),
              ),
            ),
            Center(
              child: ClipPath(
                clipper: MyClipper(
                  borderRadius: 0,
                  angle: 45,
                ),
                child: Container(
                  color: Colors.black.withOpacity(.8),
                  height: 20,
                  width: 150,
                  child: ClipPath(
                    clipper: MyClipper(
                      borderRadius: 0,
                      angle: 45,
                    ),
                    child: const Center(
                        child: Text(
                      "See All",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class MyClipper extends CustomClipper<Path> {
  final double _borderRadius; // percentage of the shortest side
  final double _angle;

  MyClipper({
    required double borderRadius,
    required double angle,
  })  : _borderRadius = borderRadius,
        _angle = angle;

  @override
  Path getClip(Size size) {
    final borderRadius = _borderRadius * size.shortestSide;
    final dx = borderRadius * cos(_angle);
    final dy = borderRadius * sin(_angle);
    final dX = size.height / tan(_angle);
    Path path = Path()
      ..moveTo(borderRadius, size.height)
      ..quadraticBezierTo(0, size.height, dx, size.height - dy)
      ..lineTo(dX - dx, dy)
      ..quadraticBezierTo(dX, 0, dX + borderRadius, 0)
      ..lineTo(size.width - borderRadius, 0)
      ..quadraticBezierTo(size.width, 0, size.width - dx, dy)
      ..lineTo(size.width - dX + dx, 0)
      ..quadraticBezierTo(size.width - dX, size.height,
          size.width - dX - borderRadius, size.height)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

double degToRad(num deg) => deg * (pi / 180.0);
