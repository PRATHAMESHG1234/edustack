import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 120, left: 20, right: 10, bottom: 120),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(44, 55, 149, 0.57),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(157.5),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/homeImage.png",
                        ),
                        Spacer(),
                        Text(
                          "Hi Prathamesh",
                          style: GoogleFonts.jost(
                              fontWeight: FontWeight.w700,
                              fontSize: 30,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, top: 25),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Courses for you",
                      style: GoogleFonts.anekTamil(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            height: 201,
                            child: ListView.builder(
                                itemCount: 2,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(right: 10),
                                    height: 201,
                                    width: 183,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [
                                              Color.fromRGBO(124, 132, 233, 1),
                                              Color.fromRGBO(219, 19, 19, 0.7),
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Upcoming  Courses",
                      style: GoogleFonts.anekTamil(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            height: 157,
                            child: ListView.builder(
                                itemCount: 2,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(right: 10),
                                    height: 157,
                                    width: 353,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [
                                              Color.fromRGBO(141, 200, 242, 1),
                                              Color.fromRGBO(55, 21, 98, 0.8)
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
