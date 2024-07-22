import '../page/home.dart';
import '../page/search.dart';
import '../page/bookmark.dart';
import '../page/category.dart';
import '../colorExtension.dart';
import 'package:flutter/material.dart';

class BotNavBar extends StatefulWidget {
  const BotNavBar({super.key});

  @override
  State<BotNavBar> createState() => _BotNavBarState();
}

class _BotNavBarState extends State<BotNavBar>
    with SingleTickerProviderStateMixin {
  var currentIndex = 0;
  final PageController _pageController = PageController();
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool isSideBarClosed = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleIcon() {
    setState(() {
      if (isSideBarClosed) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
      isSideBarClosed = !isSideBarClosed;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: [
          HomePage(
            isSideBarClosed: isSideBarClosed,
            animation: _animation,
            toggleIcon: _toggleIcon,
            authToken: '',
          ),
          SearchPage(
            isSideBarClosed: isSideBarClosed,
            animation: _animation,
            toggleIcon: _toggleIcon,
          ),
          BookmarkPage(
            isSideBarClosed: isSideBarClosed,
            animation: _animation,
            toggleIcon: _toggleIcon,
          ),
          CategoryPage(
            isSideBarClosed: isSideBarClosed,
            animation: _animation,
            toggleIcon: _toggleIcon,
          ),
        ],
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.translationValues(
          0,
          isSideBarClosed ? 0 : 100,
          0,
        ),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(4),
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 14,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              color: TColor.eleventh,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    _pageController.jumpToPage(0);
                    setState(() {
                      currentIndex = 0;
                    });
                  },
                  child: AnimatedContainer(
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 500),
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color:
                          currentIndex == 0 ? TColor.fifth : Colors.transparent,
                    ),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Icon(
                              Icons.home_outlined,
                              color: currentIndex == 0
                                  ? Colors.white
                                  : Colors.white,
                            ),
                            const Text(
                              'Home',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: mediaQuery.width / 19,
                ),
                GestureDetector(
                  onTap: () {
                    _pageController.jumpToPage(1);
                    setState(() {
                      currentIndex = 1;
                    });
                  },
                  child: AnimatedContainer(
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 500),
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color:
                          currentIndex == 1 ? TColor.fifth : Colors.transparent,
                    ),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Icon(
                              Icons.search_outlined,
                              color: currentIndex == 1
                                  ? Colors.white
                                  : Colors.white,
                            ),
                            const Text(
                              'Search',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: mediaQuery.width / 19,
                ),
                GestureDetector(
                  onTap: () {
                    _pageController.jumpToPage(2);
                    setState(() {
                      currentIndex = 2;
                    });
                  },
                  child: AnimatedContainer(
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 500),
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color:
                          currentIndex == 2 ? TColor.fifth : Colors.transparent,
                    ),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Icon(
                              Icons.bookmark_outline_outlined,
                              color: currentIndex == 2
                                  ? Colors.white
                                  : Colors.white,
                            ),
                            const Text(
                              'Bookmark',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: mediaQuery.width / 19,
                ),
                GestureDetector(
                  onTap: () {
                    _pageController.jumpToPage(3);
                    setState(() {
                      currentIndex = 3;
                    });
                  },
                  child: AnimatedContainer(
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 500),
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color:
                          currentIndex == 3 ? TColor.fifth : Colors.transparent,
                    ),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Icon(
                              Icons.category_outlined,
                              color: currentIndex == 3
                                  ? Colors.white
                                  : Colors.white,
                            ),
                            const Text(
                              'Category',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: TColor.fifth,
    );
  }
}
