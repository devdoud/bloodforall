import 'package:bloodforall/screens/onboarding_screen/onboarding_page.dart';
import 'package:flutter/material.dart';

import '../signupscreen/signup_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  List<Widget> _onboardingPages = [
    OnboardingPage(
      title: 'Entrer les paramètres \n de recherche',
      description: 'Groupe Sanguin, Facteur \n Rhésus, Poids, Age...',
      imagePath: 'assets/images/perso.jpg',
    ),
    OnboardingPage(
      title: 'Trouvez des \n banques de sang',
      description: 'A proximité et répondant aux \n critères de recherches',
      imagePath: 'assets/images/atelier.jpg',
    ),
    OnboardingPage(
      title: 'Générer le code \n aléatoire en un clic',
      description: 'Avec toutes les références,\n sur l\’ordonnance du patient',
      imagePath: 'assets/images/qrcode.jpg',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_pageListener);
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageListener);
    _pageController.dispose();
    super.dispose();
  }

  void _pageListener() {
    setState(() {
      _currentPageIndex = _pageController.page!.round();
    });
  }

  void _nextPage() {
    if (_currentPageIndex < _onboardingPages.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SignUpScreen(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildOnboardingBody(),
    );
  }

  List<Widget> _buildPageIndicators() {
    List<Widget> indicators = [];
    for (int i = 0; i < _onboardingPages.length; i++) {
      indicators.add(
        Container(
          width: _currentPageIndex == i ? 16 : 6,
          height: 6,
          margin: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            color: _currentPageIndex == i
                ? Theme.of(context).primaryColor
                : Colors.grey,
          ),
        ),
      );
    }
    return indicators;
  }

  Widget _buildOnboardingBody() {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: _pageController,
            children: _onboardingPages,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            bottom: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildPageIndicators(),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 22),
          child: SizedBox(
            width: 230,
            child: ElevatedButton(
              onPressed: _nextPage,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).primaryColor),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 48.0), // Marge interne du bouton
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        30.0), // Forme du bouton avec coins arrondis
                  ),
                ),
              ),
              child: Text(
                _currentPageIndex < _onboardingPages.length - 1
                    ? 'Suivant'
                    : 'Terminer',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
