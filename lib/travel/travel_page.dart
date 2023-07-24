import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ui_design/travel/components/my_clipper.dart';
import 'package:ui_design/travel/components/room_card.dart';

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
        body: SingleChildScrollView(
          child: Column(
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
              Stack(
                children: [
                  SizedBox(
                    height: 250,
                    child: SizedBox(
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
                          viewportFraction: 0.9,
                          autoPlay: true,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: -10,
                    child: Center(
                      child: ClipPath(
                        clipper: MyClipper(
                          borderRadius: 0,
                          angle: 45,
                        ),
                        child: Container(
                          color: Colors.grey.shade900.withOpacity(.9),
                          height: 35,
                          width: 150,
                          child: ClipPath(
                            clipper: MyClipper(
                              borderRadius: 0,
                              angle: 75,
                            ),
                            child: const Center(
                                child: Text(
                              "See All 2/68",
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Expanded(
                      child: _ActivityTab(
                        imagePath: "assets/icons/theme@2x.png",
                        name: 'Amenities',
                      ),
                    ),
                    Expanded(
                      child: _ActivityTab(
                        imagePath: "assets/icons/workout@2x.png",
                        name: 'Facilities',
                      ),
                    ),
                    Expanded(
                      child: _ActivityTab(
                        imagePath: "assets/icons/fnb@2x.png",
                        name: 'F&B',
                      ),
                    ),
                    Expanded(
                      child: _ActivityTab(
                        imagePath: "assets/icons/kidsfamily@2x.png",
                        name: 'Kids/Family',
                      ),
                    ),
                    Expanded(
                      child: _ActivityTab(
                        imagePath: "assets/icons/wellness@2x.png",
                        name: 'Wellness',
                      ),
                    ),
                  ],
                ),
              ),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const RoomCard();
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Colors.black,
                    );
                  },
                  itemCount: 10),
            ],
          ),
        ));
  }
}

class _ActivityTab extends StatelessWidget {
  const _ActivityTab({super.key, required this.imagePath, required this.name});
  final String imagePath;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          height: 40,
        ),
        Text(
          name,
          style: const TextStyle(fontSize: 12),
        )
      ],
    );
  }
}
