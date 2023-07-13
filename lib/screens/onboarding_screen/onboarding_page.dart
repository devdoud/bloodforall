import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const OnboardingPage({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 34.0, left: 16.0, right: 16.0),
      child: Column(
        children: [
          Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            width: 311,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: 300.0,
                height: 300.0,
              ),
              SizedBox(height: 25.0),
              Text(
                title,
                style: Theme.of(context).textTheme.displayLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.0),
              Text(
                description,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ]),
          )
        ],
      ),
    );
  }
}
