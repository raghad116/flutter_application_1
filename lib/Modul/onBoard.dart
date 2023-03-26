import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/Layout/components/components.dart';
import 'package:flutter_application_1/Modul/shopLogin.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  String? image;
  String? title1;
  String? title2;

  BoardingModel({
    required this.image,
    required this.title1,
    required this.title2,
  });
}

class OnBoarding extends StatefulWidget {
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<BoardingModel> onboarding = [
    BoardingModel(
        image: 'assets/images/International trade-bro.png',
        title1: 'title1',
        title2: 'second title1'),
    BoardingModel(
        image: 'assets/images/International trade-bro.png',
        title1: 'title2',
        title2: 'second title2'),
    BoardingModel(
        image: 'assets/images/International trade-bro.png',
        title1: 'title3',
        title2: 'second title3'),
  ];

  var boardingController = PageController();

  bool islast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextButton(
                  onPressed: () {
                    navigateAndFinish(context, ShopLogin());
                  },
                  child: Text(
                    'skip',
                    style: TextStyle(color: Colors.red),
                  )),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemBuilder: (context, index) =>
                      onboardingItem(onboarding[index]),
                  itemCount: onboarding.length,
                  controller: boardingController,
                  onPageChanged: (index) {
                    if (index == onboarding.length - 1) {
                      setState(() {
                        islast = true;
                      });
                    } else {
                      setState(() {
                        islast = false;
                      });
                    }
                  },
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                    controller: boardingController,
                    count: onboarding.length,
                    effect: ExpandingDotsEffect(
                        activeDotColor: Colors.red,
                        dotHeight: 15,
                        dotColor: Colors.grey,
                        spacing: 2,
                        expansionFactor: 3),
                  ),
                  Spacer(),
                  FloatingActionButton(
                    backgroundColor: Colors.red,
                    onPressed: () {
                      if (islast) {
                        navigateAndFinish(context, ShopLogin());
                      }

                      boardingController.nextPage(
                          duration: Duration(milliseconds: 50),
                          curve: Curves.fastLinearToSlowEaseIn);
                    },
                    child: Icon(Icons.forward),
                  )
                ],
              )
            ],
          ),
        ));
  }

  Widget onboardingItem(BoardingModel model) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: Image(image: AssetImage('${model.image}')),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '${model.title1}',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '${model.title2}',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ]);
}
