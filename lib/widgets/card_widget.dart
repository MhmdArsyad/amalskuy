import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class TeacherCard extends StatelessWidget {
  const TeacherCard({
    Key? key,
    required this.faker,
  }) : super(key: key);

  final Faker faker;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 111,
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: blueDark.withOpacity(0.12), width: 1),
          color: Colors.white),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                faker.image.image(random: true, keywords: ["person"]),
                width: 75,
                height: 75,
                fit: BoxFit.cover,
              )),
          const SizedBox(
            width: 16,
          ),
          const Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Contoh Judul Amal atau Donasi",
                style: TextStyle(fontSize: 12, color: kprimaryColor, fontWeight: FontWeight.w800),
              ),
              Flexible(
                flex: 1,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "Rp. 6.200.2500 Terkumpul",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "100+ Orang Baik Telah Berdonasi • 1 Minggu",
                    style: TextStyle(
                        fontSize: 10,
                        color: Color(0xff91919F),
                        fontWeight: FontWeight.normal),
                    maxLines: 1,
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
