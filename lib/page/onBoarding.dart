import '../auth/login.dart';
import '../colorExtension.dart';
import '../model/onBoardingModel.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: onBoardingContents.length,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(onBoardingContents[i].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              spreadRadius: 10,
                              blurRadius: 5,
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: mediaQuery.height / 50,
                            ),
                            Text(
                              onBoardingContents[i].title,
                              style: TextStyle(
                                color: TColor.sixth,
                                fontWeight: FontWeight.w600,
                                fontSize: mediaQuery.height / 34,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: mediaQuery.height / 50,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              onBoardingContents[i].description,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: mediaQuery.height / 52,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: mediaQuery.height / 50,
                ),
                Container(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onBoardingContents.length,
                      (index) => buildDot(index, context),
                    ),
                  ),
                ),
                SizedBox(
                  height: mediaQuery.height / 50,
                ),
                Container(
                  color: Colors.transparent,
                  height: mediaQuery.height / 17,
                  width: mediaQuery.width / 1.1,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(TColor.third),
                    ),
                    onPressed: () {
                      if (currentIndex == onBoardingContents.length - 1) {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    LoginPage(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              const begin = Offset(1, 0);
                              const end = Offset.zero;
                              const curve = Curves.easeInOut;

                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));
                              var offsetAnimation = animation.drive(tween);

                              return SlideTransition(
                                position: offsetAnimation,
                                child: child,
                              );
                            },
                          ),
                        );
                      } else {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.bounceIn,
                        );
                      }
                    },
                    child: Text(
                      currentIndex == onBoardingContents.length - 1
                          ? 'Continue'
                          : 'Next',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: mediaQuery.height / 50),
                    ),
                  ),
                ),
                SizedBox(
                  height: mediaQuery.height / 50,
                ),
              ],
            ),
          )
        ],
      ),
      backgroundColor: Colors.black,
    );
  }

  Container buildDot(int index, BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    return Container(
      width:
          currentIndex == index ? mediaQuery.width / 8 : mediaQuery.width / 12,
      height: mediaQuery.height / 107,
      margin: EdgeInsets.only(right: mediaQuery.width / 60),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: TColor.first,
      ),
    );
  }
}
