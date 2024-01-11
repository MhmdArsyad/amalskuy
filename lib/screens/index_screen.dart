import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:amalskuy/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/card_widget.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  
  Faker faker = Faker();
  final PageController _pageController = PageController(viewportFraction: 0.9);
  
  int selectedPrice = 4;
  final user = FirebaseAuth.instance.currentUser!;

  String getUsernameFromEmail(String email) {
    final splitEmail = email.split('@');
    return splitEmail[0];
  }

  String selectedGender = "Male";
  int limit = 2; // recomended tutor min

  @override
  Widget build(BuildContext context) {
    final username = getUsernameFromEmail(user.email!);
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox( height: 20,),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                    faker.image.image(keywords: ['person']),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Flexible(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.center,
                        child: Text(
                          username,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: kprimaryColor),
                        ),
                      ),
                    ),
                    const Flexible(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.center,
                        child: Text(
                          "Selamat Datang di AmalSkuy",
                          style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Yuk Mulai Beramal!",
              style: TextStyle(
                  color: Colors.black, fontSize: 29, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            width: size.width * 0.9,
            child: TextFormField(
              cursorColor: dimGrey,
              enableSuggestions: true,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                  filled: true,
                  alignLabelWithHint: true,
                  fillColor: whitishGrey,
                  hintStyle: TextStyle(fontSize: 15, color: dimGrey),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SvgPicture.asset(
                      "assets/icons/search.svg",
                      color: kprimaryColor,
                    ),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.white,
                          enableDrag: true,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15))),
                          builder: (_) => StatefulBuilder(
                                builder: (context, setState) =>
                                    SingleChildScrollView(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Text(
                                          "Filter Pencarian",
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: blueDark,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Urutkan",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: blueDark,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16),
                                        child: Wrap(
                                          spacing: 6,
                                          runSpacing: 12,
                                          runAlignment: WrapAlignment.start,
                                          alignment: WrapAlignment.start,
                                          crossAxisAlignment:
                                              WrapCrossAlignment.start,
                                          children: [
                                            IntrinsicWidth(
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(
                                                    () {
                                                      selectedGender = "Terbaru";
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                    height: 30,
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 32),
                                                    decoration: BoxDecoration(
                                                        color: "Terbaru" ==
                                                                selectedGender
                                                            ? kprimaryColor
                                                            : Tint,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15)),
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Terbaru",
                                                      style: TextStyle(
                                                          color: "Terbaru" ==
                                                                  selectedGender
                                                              ? Colors.white
                                                              : Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )),
                                              ),
                                            ),
                                            IntrinsicWidth(
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(
                                                    () {
                                                      selectedGender = "Trending";
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                    height: 30,
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 32),
                                                    decoration: BoxDecoration(
                                                        color: "Trending" ==
                                                                selectedGender
                                                            ? kprimaryColor
                                                            : Tint,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15)),
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Trending",
                                                      style: TextStyle(
                                                          color: "Trending" ==
                                                                  selectedGender
                                                              ? Colors.white
                                                              : Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )),
                                              ),
                                            ),
                                          IntrinsicWidth(
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(
                                                    () {
                                                      selectedGender = "Akan Berakhir";
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                    height: 30,
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 32),
                                                    decoration: BoxDecoration(
                                                        color: "Akan Berakhir" ==
                                                                selectedGender
                                                            ? kprimaryColor
                                                            : Tint,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15)),
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Akan Berakhir",
                                                      style: TextStyle(
                                                          color: "Akan Berakhir" ==
                                                                  selectedGender
                                                              ? Colors.white
                                                              : Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )),
                                              ),
                                            ),
                                          
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 50,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 7),
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: const Text(
                                            "Terapkan Filter",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 17),
                                          ),
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      kprimaryColor),
                                              shape: MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ))),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 50,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 7),
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: const Text(
                                            "Hapus Semua",
                                            style: TextStyle(
                                                color: kprimaryColor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 17),
                                          ),
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.white),
                                              overlayColor:
                                                  MaterialStateProperty.all(
                                                      kprimaryColor.withOpacity(
                                                          0.2)),
                                              shape: MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                      side: const BorderSide(
                                                          color: kprimaryColor)))),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ));
                    },
                    child: Image.asset(
                        "assets/search.png",
                      ),
                  ),
                  hintText: "Cari Amal atau Donasi",
                  prefixIconConstraints:
                      const BoxConstraints(maxHeight: 17, maxWidth: 50),
                  isDense: true,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  prefixStyle: TextStyle(color: whitishGrey),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide.none)),
            ),
          ),
          SizedBox(
            height: 200,
            child: PageView.builder(
              controller: _pageController,
              padEnds: true,
              itemCount: 3,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, __) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Image.asset(
                    "assets/card" + (__ + 1).toString() + ".png",
                  ),
                );
              },
            ),
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: 3,
            effect: ExpandingDotsEffect(
                dotHeight: 6,
                dotWidth: 6,
                dotColor: Tint,
                activeDotColor: kprimaryColor),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(
                  child: FittedBox(
                  child: Text(
                    "Informasi Amal Terbaru",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w800),
                  ),
                )),
                Flexible(
                    child: FittedBox(
                  child: TextButton(
                    onPressed: () {
                      if (limit == 2) {
                        setState(() {
                          limit = 50;
                        });
                      } else {
                        setState(() {
                          limit = 2;
                        });
                      }
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                    ),
                    child: Text(
                      limit == 2 ? "Lihat Semua" : "Perkecil",
                      style: GoogleFonts.manrope(
                        color: kprimaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ))
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: min(limit, 12),
            itemBuilder: (context, index) => TeacherCard(faker: faker),
          )
        ],
      ),
    );
  }
}
