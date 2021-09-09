import 'package:flutter/material.dart';
import 'package:shop_app/models/boarding_model/boarding_model.dart';
import 'package:shop_app/modules/screens/login_screen/login_screen.dart';
import 'package:shop_app/modules/screens/on_boarding_screen/components/on_boarding_components.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/styles/colors/colors.dart';
import 'package:shop_app/shared/styles/themes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBoardingScreen extends StatefulWidget {
  const onBoardingScreen({Key? key}) : super(key: key);

  @override
  _onBoardingScreenState createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  @override
  bool is_last_page_onboarding = false;
  List<BoardingModel> on_boarding_items = [
    BoardingModel(
      image: 'assets/images/undraw_web_shopping_re_owap.png',
      title: 'On Board 1 Title',
      body: 'On Board 1 Body',
    ),
    BoardingModel(
      image: 'assets/images/undraw_web_shopping_re_owap.png',
      title: 'On Board 2 Title',
      body: 'On Board 2 Body',
    ),
    BoardingModel(
      image: 'assets/images/undraw_web_shopping_re_owap.png',
      title: 'On Board 3 Title',
      body: 'On Board 3 Body',
    ),
  ];

  PageController on_boarding_controller = PageController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () { navigateAndFinish(context, LoginScreen());},
              child: Text(
                'SKIP',
                style: TextStyle(color: primary_color),
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: on_boarding_items.length,
                controller: on_boarding_controller,
                onPageChanged: (index){
                  if(index ==on_boarding_items.length-1){
                    setState(() {
                      is_last_page_onboarding = true;
                    });
                  }
                  else{
                    setState(() {
                      is_last_page_onboarding = false;
                    });
                  }
                },
                itemBuilder: (BuildContext context, int index) =>
                    build_boarding_item(on_boarding_items[index]),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                    effect: JumpingDotEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                    ),
                    controller: on_boarding_controller,
                    count: on_boarding_items.length),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (is_last_page_onboarding) {
                      navigateAndFinish(context, LoginScreen());
                    } else {
                      on_boarding_controller.nextPage(
                        duration: Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: Icon(Icons.arrow_forward),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
