import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:amalskuy/constants.dart';
import 'package:amalskuy/screens/index_screen.dart';
import 'package:amalskuy/screens/search_screen.dart';
import 'package:amalskuy/screens/profile_screen.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _screens = const [
    IndexScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        backgroundColor: const Color(0xffF4FAFB),
        body: _screens[_index],
        floatingActionButton: SizedBox(
          width: 58,
          height: 58,
          child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  _index = 1;
                });
              },
              backgroundColor: _index == 1 ? kprimaryColor : Tint,
              child: SvgPicture.asset(
                "assets/hand.svg",
                color: Colors.white,
                height: 30,
              )),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: SizedBox(
          height: 60,
          child: BottomAppBar(
            notchMargin: 15,
            color: Colors.white,
            shape: const CircularNotchedRectangle(),
            child: Row(
              children: [
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _index = 0;
                          });
                        },
                        icon: SvgPicture.asset(
                          "assets/icons/home.svg",
                          color: _index == 0 ? kprimaryColor : Tint,
                        )),
                  ],
                )),
                const SizedBox(
                  width: 73,
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                         onPressed: () {
                          setState(() {
                            _index = 2;
                          });
                        },
                        icon: SvgPicture.asset(
                          "assets/icons/profile.svg",
                          color: _index == 2 ? kprimaryColor : Tint,
                        ))
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
