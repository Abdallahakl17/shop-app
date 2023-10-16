// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shop/app/aap_text.dart';
import 'package:shop/app/app_images.dart';
import 'package:shop/presention/screens/login.dart';
import 'package:shop/presention/widgets/custom_veiw.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../app/app_color.dart';
import '../widgets/page_veiw_items.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  var pageControlle = PageController();

  bool isLast = false;

  List<CustomVeiw> boarding = [
    CustomVeiw(
        head: AppText.head1,
        image: AppImages.onBoarding1,
        title: AppText.title1),
    CustomVeiw(
        head: AppText.head2,
        image: AppImages.onBoarding2,
        title: AppText.title2),
    CustomVeiw(
        head: AppText.head3,
        image: AppImages.onBoarding3,
        title: AppText.title3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scfColor,
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {   context.navigatAndRemove(const Login());},
              child: Text(
                'Skip',
                style: TextStyle(color: AppColor.secondColor, fontSize: 18),
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: PageView.builder(
                
                itemCount: boarding.length,
                controller: pageControlle,
                onPageChanged: (i) {
                  if (i == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) {
                  return buildBoarding(context, boarding[index]);
                },
              )),
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: SmoothPageIndicator(
                count: boarding.length,
                controller: pageControlle,
                effect: SlideEffect(
                    spacing: 5.0,
                    radius: 6.0,
                    dotWidth: 6.0,
                    dotHeight: 6.0,
                    paintStyle: PaintingStyle.fill,
                    strokeWidth: 1.5,
                    activeDotColor: AppColor.whaitColor,
                    dotColor: Colors.grey)),
          ),
          Expanded(
            flex: 1,
            child: FloatingActionButton(
              onPressed: () {
                if (isLast) {
                  setState(() {
                    context.navigatAndRemove(const Login());
                  });
                } else {
                  pageControlle.nextPage(
                      duration: const Duration(milliseconds: 760),
                      curve: Curves.fastEaseInToSlowEaseOut);
                }
              },
              child: const Icon(Icons.arrow_forward),
            ),
          ),
        ],
      ),
    );
  }
}

extension Navigat on BuildContext {
  navigatTo(Widget screen) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => screen));
  }
}

extension NavigatRemove on BuildContext {
  navigatAndRemove(Widget screen) {
    Navigator.pushAndRemoveUntil(this,
        MaterialPageRoute(builder: (context) => screen), (route) => false);
  }
}

