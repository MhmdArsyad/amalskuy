class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Satukan Tangan, Demi Kebaikan",
    image: "assets/images/onboardart1.png",
    desc: "Bersama untuk meraih kebaikan, bergandeng tangan untuk membantu satu sama lain.",
  ),
  OnboardingContents(
    title: "Satukan Donasi, Raih Solidaritas",
    image: "assets/images/onboardart2.png",
    desc:
        "Tabung amal jariyah kamu, dan salurkan kepada mereka yang lebih membutuhkan bersama AmalSkuy",
  ),
  OnboardingContents(
    title: "",
    image: "assets/images/barengamalskuy.png",
    desc: "",
  ),
];
