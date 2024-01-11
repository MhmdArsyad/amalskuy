import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:amalskuy/constants.dart';

import '../widgets/card_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Faker faker = Faker();

  String selectedGender = "Terbaru";
  List<String> subjects = [
    "Kesehatan",
    "Balita",
    "Sedekah",
    "Sosial",
    "Bencana",
    "Peduli lingkungan",
    "Tidak Mampu",
    "Pendidikan",
    "Infrastruktur",
  ];
  List<String> selectedSubjects = [];
  bool search = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Center(
            child: SizedBox(
              width: size.width * 0.9,
              child: TextFormField(
                cursorColor: kprimaryColor,
                enableSuggestions: true,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                    filled: true,
                    alignLabelWithHint: true,
                    fillColor: const Color(0xffDCEBEA),
                    hintStyle: TextStyle(fontSize: 15, color: blueDark),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SvgPicture.asset(
                        "assets/icons/search.svg",
                        color: blueDark,
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
                                                shape:
                                                    MaterialStateProperty.all(
                                                        RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
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
                                            child: Text(
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
                                                        kprimaryColor
                                                            .withOpacity(0.2)),
                                                shape: MaterialStateProperty.all(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                4.0),
                                                        side: BorderSide(
                                                            color:
                                                                kprimaryColor)))),
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
          ),
          search
              ? ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 15,
                  itemBuilder: (context, index) => TeacherCard(faker: faker),
                )
              : Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 16, horizontal: size.width * 0.075),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Kategori",
                        style: TextStyle(
                            color: blueDark,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Wrap(
                      spacing: 6,
                      runSpacing: 12,
                      runAlignment: WrapAlignment.start,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: List.generate(
                        subjects.length,
                        (index) => IntrinsicWidth(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (selectedSubjects
                                    .contains(subjects[index])) {
                                  selectedSubjects.remove(subjects[index]);
                                } else {
                                  selectedSubjects.add(subjects[index]);
                                }
                              });
                            },
                            child: Container(
                              height: 30,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                  color:
                                      selectedSubjects.contains(subjects[index])
                                          ? kprimaryColor
                                          : Tint,
                                  borderRadius: BorderRadius.circular(15)),
                              alignment: Alignment.center,
                              child: Text(
                                subjects[index],
                                style: TextStyle(
                                    color: selectedSubjects
                                            .contains(subjects[index])
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 16, horizontal: size.width * 0.075),
                      alignment: Alignment.centerLeft,
                      ),
                   const SizedBox(
                      height: 60,
                    ),
                    Container(
                      width: size.width * 0.9,
                      height: 50,
                      margin: const EdgeInsets.symmetric(vertical: 7),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            search = true;
                          });
                        },
                        child: const Text(
                          "Cari Sekarang",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(kprimaryColor),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ))),
                      ),
                    ),
                    Container(
                      width: size.width * 0.9,
                      height: 50,
                      margin: const EdgeInsets.symmetric(vertical: 7),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedSubjects.clear();
                            selectedGender = "Terbaru";
                          });
                        },
                        child: Text(
                          "Hapus Semua",
                          style: TextStyle(
                              color: kprimaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            overlayColor: MaterialStateProperty.all(
                                kprimaryColor.withOpacity(0.2)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    side: BorderSide(color: kprimaryColor)))),
                      ),
                    )
                  ],
                )
        ],
      ),
    );
  }
}
