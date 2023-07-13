import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
          child: SizedBox(
        height: 50,
        width: 100,
        child: LoadingIndicator(
            indicatorType: Indicator.ballSpinFadeLoader,
            colors: [
              Colors.white,
              Colors.green,
              Colors.yellow,
              Colors.red,
              Colors.blue
            ],
            strokeWidth: 1,
            backgroundColor: Colors.transparent,
            pathBackgroundColor: Colors.blue),
      )),
    );
  }
}
