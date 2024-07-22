import 'dart:math';
import '../colorExtension.dart';
import '../model/bookModel.dart';
import '../components/sideBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  final String authToken;
  final bool isSideBarClosed;
  final Animation<double> animation;
  final VoidCallback toggleIcon;

  const HomePage({
    Key? key,
    required this.isSideBarClosed,
    required this.animation,
    required this.toggleIcon,
    required this.authToken,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
          width: 200,
          left: widget.isSideBarClosed ? -200 : 0,
          height: MediaQuery.of(context).size.height,
          child: const SideBar(),
        ),
        IgnorePointer(
          ignoring: !widget.isSideBarClosed,
          child: AnimatedBuilder(
            animation: widget.animation,
            builder: (context, child) {
              double translateValue = 200 * widget.animation.value;
              double scaleValue = 1 - 0.2 * widget.animation.value;
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(widget.animation.value -
                      30 * widget.animation.value * pi / 180),
                child: Transform.translate(
                  offset: Offset(translateValue, 0),
                  child: Transform.scale(
                    scale: scaleValue,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(20 * widget.animation.value),
                      child: child,
                    ),
                  ),
                ),
              );
            },
            child: Scaffold(
              body: SafeArea(
                bottom: false,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        TColor.third,
                        TColor.fifth,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: mediaQuery.height),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 13,
                                  horizontal: 50,
                                ),
                                child: Text(
                                  'Pro-Ledge',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  CupertinoIcons.bell,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  color: Colors.transparent,
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hello Mordzz',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      'Have a Nice Day',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20, top: 20),
                            child: Text(
                              'Continue Reading',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            child: Text(
                              'Continue reading to see what next',
                              style: TextStyle(
                                color: TColor.eighth,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: SizedBox(
                              width: MediaQuery.sizeOf(context).width,
                              height: 170,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: bookContents.map((book) {
                                  return InkWell(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 80,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            image: DecorationImage(
                                              image: AssetImage(book.image),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                book.title,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                book.author,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 20,
                            ),
                            child: Text(
                              'Popular Books',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            child: Text(
                              'The books everyone is loving',
                              style: TextStyle(
                                color: TColor.eighth,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: SizedBox(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height - 420,
                              child: ListView(
                                scrollDirection: Axis.vertical,
                                children: bookContents.map((book) {
                                  return InkWell(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Container(
                                            width: 80,
                                            height: 150,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              image: DecorationImage(
                                                image: AssetImage(book.image),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                book.title,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                book.author,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          left: widget.isSideBarClosed ? 0 : 140,
          curve: Curves.fastOutSlowIn,
          child: IconButton(
            onPressed: widget.toggleIcon,
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return RotationTransition(
                  turns: Tween<double>(begin: 0, end: 1).animate(animation),
                  child: FadeTransition(opacity: animation, child: child),
                );
              },
              child: widget.isSideBarClosed
                  ? const Icon(
                      Icons.menu,
                      key: ValueKey('menu'),
                      color: Colors.white,
                      size: 40,
                    )
                  : const Icon(
                      Icons.close,
                      key: ValueKey('close'),
                      color: Colors.white,
                      size: 40,
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
