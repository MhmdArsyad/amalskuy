import 'package:flutter/material.dart';
import 'package:amalskuy/screens/size_config.dart';
import 'package:amalskuy/screens/onboarding_contents.dart';
import 'package:amalskuy/pages/auth_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  int _currentPage = 0;
  List colors = const [
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  AnimatedContainer _buildDots({
    int? index,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: Color(0xFF4285F6),
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;

    return Scaffold(
      backgroundColor: colors[_currentPage],
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: _controller,
                onPageChanged: (value) => setState(() => _currentPage = value),
                itemCount: contents.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        Image.asset(
                          contents[i].image,
                          height: SizeConfig.blockV! * 35,
                        ),
                        SizedBox(
                          height: (height >= 840) ? 60 : 30,
                        ),
                        Text(
                          contents[i].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF4285F6),
                            fontFamily: "DMSans",
                            fontWeight: FontWeight.w800,
                            fontSize: (width <= 550) ? 30 : 35,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          contents[i].desc,
                          style: TextStyle(
                            fontFamily: "DMSans",
                            fontWeight: FontWeight.w400,
                            fontSize: (width <= 550) ? 17 : 25,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      contents.length,
                      (int index) => _buildDots(
                        index: index,
                      ),
                    ),
                  ),
                  _currentPage + 1 == contents.length
                      ? Padding(
                          padding: const EdgeInsets.only(top: 30, bottom: 0, left: 30, right: 30),
                          child: ElevatedButton(
                            onPressed: _navigateToSignUpScreen,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4285F6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              padding: (width <= 550)
                                  ? const EdgeInsets.symmetric(
                                      horizontal: 100, vertical: 20)
                                  : EdgeInsets.symmetric(
                                      horizontal: width * 0.2, vertical: 25),
                              textStyle:
                                  TextStyle(fontSize: (width <= 550) ? 13 : 17),
                            ),
                            child: const Text("Skuy",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "DMSans",
                              fontWeight: FontWeight.w600,
                            ),),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 30, bottom: 0, left: 30, right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  _controller.jumpToPage(2);
                                },
                                style: TextButton.styleFrom(
                                  elevation: 0,
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: (width <= 550) ? 13 : 17,
                                  ),
                                ),
                                child: const Text(
                                  "Lewati",
                                  style: TextStyle(
                                    color: Color(0xFF4285F6),
                                    fontFamily: "DMSans",
                                    fontWeight: FontWeight.w600),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _controller.nextPage(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeIn,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF4285F6),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  elevation: 0,
                                  padding: (width <= 550)
                                      ? const EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 20)
                                      : const EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 25),
                                  textStyle: TextStyle(
                                      fontSize: (width <= 550) ? 13 : 17),
                                ),
                                child: const Text("Selanjutnya",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "DMSans",
                                  fontWeight: FontWeight.w600
                                ),),
                              ),
                            ],
                          ),
                        ),
                      const Padding(
                        padding: EdgeInsets.only(top: 0, bottom: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text('Powered by Respect Team',
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: "DMSans",
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),)],
                        ),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _navigateToSignUpScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AuthPage()),
    );
 }
}
