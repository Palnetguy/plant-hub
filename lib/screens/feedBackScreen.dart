// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:plant_scan/constants/const.dart';

import '../widgets/midx_appbar.dart';

class FeedBackScreen extends StatelessWidget {
  const FeedBackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          // appBar/ header
          MidxAppbar(
            title: 'Feedback',
          ),
          // body
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 35),
            child: Body(),
          )
        ],
      ),
    );
  }
}

// body
class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'TELL US TO IMPROVE',
          style: TextStyle(
            color: buttonColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            'Your review is important to build this platform user friendly and easy to use.  ',
            style: TextStyle(
              color: buttonColor,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),

        // rating
        Padding(
          padding:
              const EdgeInsets.only(top: 20, right: 15, left: 15, bottom: 20),
          child: Rating(
            starCount: 5,
          ),
        ),

        // head b4 text area
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 10, bottom: 10),
          child: const Text(
            'Let us know what you think',
            style: TextStyle(
              color: Color(0xFF104B50),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        // text area
        TextField(
          maxLines: null, // Allow unlimited lines
          minLines: 5,
          cursorColor: buttonColor,
          decoration: InputDecoration(
            hintText: 'Write your review here...',
            hintStyle: const TextStyle(
              color: Color(0xFFAFAFAF),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            border: const OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Color(0xFF696464),
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Color(0xFF696464),
                width: 1.5,
              ),
            ),
          ),
        ),
        // done button

        Container(
          margin: const EdgeInsets.only(top: 40),
          padding: const EdgeInsets.symmetric(vertical: 15),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: buttonColor,
          ),
          child: const Text(
            'Done',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}

class Rating extends StatefulWidget {
  int starCount;
  Rating({
    super.key,
    required this.starCount,
  });

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.starCount.toDouble().toString(),
          style: const TextStyle(
            fontSize: 50,
            color: Color(0xFF104B50),
            fontWeight: FontWeight.w600,
          ),
        ),
        // stars
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 1,
            IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                setState(() {
                  widget.starCount = 1;
                });
              },
              icon: Icon(
                Icons.star_rate_rounded,
                size: 50,
                color: widget.starCount >= 1
                    ? const Color(0xFFFFAF09)
                    : Colors.grey.withOpacity(.7),
              ),
            ),
            // 2,
            IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                setState(() {
                  widget.starCount = 2;
                });
              },
              icon: Icon(
                Icons.star_rate_rounded,
                size: 50,
                color: widget.starCount >= 2
                    ? const Color(0xFFFFAF09)
                    : Colors.grey.withOpacity(.7),
              ),
            ),
            // 3,
            IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                setState(() {
                  widget.starCount = 3;
                });
              },
              icon: Icon(
                Icons.star_rate_rounded,
                size: 50,
                color: widget.starCount >= 3
                    ? const Color(0xFFFFAF09)
                    : Colors.grey.withOpacity(.7),
              ),
            ),
            // 4,
            IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                setState(() {
                  widget.starCount = 4;
                });
              },
              icon: Icon(
                Icons.star_rate_rounded,
                size: 50,
                color: widget.starCount >= 4
                    ? const Color(0xFFFFAF09)
                    : Colors.grey.withOpacity(.7),
              ),
            ),
            // 5,
            IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                setState(() {
                  widget.starCount = 5;
                });
              },
              icon: Icon(
                Icons.star_rate_rounded,
                size: 50,
                color: widget.starCount >= 5
                    ? const Color(0xFFFFAF09)
                    : Colors.grey.withOpacity(.7),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
