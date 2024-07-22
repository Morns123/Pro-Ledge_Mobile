import 'dart:math';
import '../colorExtension.dart';
import '../components/sideBar.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final bool isSideBarClosed;
  final Animation<double> animation;
  final VoidCallback toggleIcon;

  const SearchPage({
    Key? key,
    required this.isSideBarClosed,
    required this.animation,
    required this.toggleIcon,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                ),
              ),
              backgroundColor: TColor.seventh,
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
