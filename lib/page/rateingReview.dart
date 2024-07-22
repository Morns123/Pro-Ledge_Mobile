import 'package:flutter/material.dart';

import '../colorExtension.dart';

class RateingReviewPage extends StatefulWidget {
  const RateingReviewPage({super.key});

  @override
  State<RateingReviewPage> createState() => _RateingReviewPageState();
}

class _RateingReviewPageState extends State<RateingReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Rate your Experience',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            
            Center(
              child: Text(
                'how was your experience'.toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            
            Center(
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(65),
                ),
              ),
            ),
            
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 115),
              child: Divider(
                height: 1,
                color: Color(0xffEDBB08),
              ),
            ),
            
            Center(
              child: Text(
                'loved it'.toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.star_rounded,
                  color: Color(0xffFFB200),
                  size: 30,
                ),
                Icon(
                  Icons.star_rounded,
                  color: Color(0xffFFB200),
                  size: 30,
                ),
                Icon(
                  Icons.star_rounded,
                  color: Color(0xffFFB200),
                  size: 30,
                ),
                Icon(
                  Icons.star_rounded,
                  color: Color(0xffFFB200),
                  size: 30,
                ),
                Icon(
                  Icons.star_rounded,
                  color: Color(0xffFFB200),
                  size: 30,
                ),
              ],
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                height: 1,
                color: TColor.eleventh,
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                maxLines: 5,
                autofocus: false,
                decoration: InputDecoration(
                  labelText: 'Write a review',
                  labelStyle: const TextStyle(color: Colors.white),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(TColor.tenth),
                  elevation: const WidgetStatePropertyAll(5),
                  minimumSize: const WidgetStatePropertyAll(
                    Size(double.infinity, 50),
                  ),
                  shadowColor: const WidgetStatePropertyAll(Colors.black),
                  shape: const WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                child: const Text(
                  'Send',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: TColor.seventh,
    );
  }
}
