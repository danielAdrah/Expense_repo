import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../homePage.dart';
import '../data/onboarding_design.dart';
import 'welcome.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController _controller = PageController();
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: pages.length,
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                //that means we are in the last page
                isLastPage = (index == 2);
              });
            },
            itemBuilder: ((context, index) {
              return Container(
                color: Colors.grey[300],
                child: Column(children: [
                  const SizedBox(
                    height: 200,
                  ),
                  SizedBox(
                    width: 260,
                    height: 260,
                    child: Center(
                        child: SvgPicture.asset(pages[index].image ?? "3333")),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    pages[index].title!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      pages[index].body!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ]),
              );
            }),
          ),
          Container(
              alignment: const Alignment(0, 0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect:
                        const ExpandingDotsEffect(activeDotColor: Colors.black),
                  ),
                  isLastPage
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: ((context) {
                              return const Welcome();
                            })));
                          },
                          child: const Text(
                            "Done",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: const Text("Next",
                              style: TextStyle(fontWeight: FontWeight.w500)),
                        ),
                ],
              )),
        ],
      ),
    );
  }
}
