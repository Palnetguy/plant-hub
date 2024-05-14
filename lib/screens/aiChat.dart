// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:plant_scan/constants/const.dart';

// styles
const textStyleMass1 = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w400,
  fontSize: 12,
);
const textStyleMassTime = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w300,
  fontSize: 10,
);
// end Styles

class AiChat extends StatelessWidget {
  final VoidCallback? goBack;
  const AiChat({
    super.key,
    this.goBack,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header/appber
          HeaderAppBar(
            goBack: goBack,
          ),

          // messeges
          MessegesSection(),

          // InputAra
          InputArea(),
        ],
      ),
    );
  }
}

// messege section
class MessegesSection extends StatelessWidget {
  const MessegesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(top: 20),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            RecievedMessegeModule(
              text: 'Hi there, what can i do for you today',
              time: '7:30',
            ),
            SentMessegeModule(
              text: 'Show me some ramdom fruit',
              time: '7:32',
            ),
            RecievedImagesModule(
              text: 'Hi there, what can i do for you today',
              time: '7:30',
              imageLink: 'assets/images/tomatoes.jpg',
            ),
            SentImageModule(
              text: 'Hi there, what can i do for you today',
              time: '7:30',
              imageLink: 'assets/images/tomatoes.jpg',
            ),
            RecievedMessegeModule(
              text: 'Its a tomato',
              time: '7:31',
            )
          ],
        ),
      ),
    );
  }
}

// recieved Module

// text recived
class RecievedMessegeModule extends StatelessWidget {
  final String text;
  final String time;

  const RecievedMessegeModule({
    super.key,
    required this.text,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 0,
            top: 5,
            bottom: 5,
          ),
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 5,
            left: 5,
            right: 15,
          ),
          width: (MediaQuery.of(context).size.width / 1.8),
          decoration: const BoxDecoration(
            color: Color(0xFF04998F),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: textStyleMass1,
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: Text(
                  time,
                  style: textStyleMassTime,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Image Recived
class RecievedImagesModule extends StatelessWidget {
  final String text;
  final String time;
  final String imageLink;

  const RecievedImagesModule({
    super.key,
    required this.text,
    required this.time,
    required this.imageLink,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 0,
            top: 5,
            bottom: 5,
          ),
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 5,
            left: 5,
            right: 15,
          ),
          width: (MediaQuery.of(context).size.width / 1.8),
          decoration: const BoxDecoration(
            color: Color(0xFF04998F),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(imageLink),
                    // image: NetworkImage('assets/images/tomatoes.jpg'),
                  ),
                  // color: Color(0xFF04998F),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    topRight: Radius.circular(6),
                  ),
                ),
              ),
              Text(
                text,
                style: textStyleMass1,
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: Text(
                  time,
                  style: textStyleMassTime,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Sent Module
// text
class SentMessegeModule extends StatelessWidget {
  final String text;
  final String time;

  const SentMessegeModule({
    super.key,
    required this.text,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 0,
            top: 5,
            bottom: 5,
          ),
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 5,
            left: 15,
            right: 5,
          ),
          width: (MediaQuery.of(context).size.width / 1.8),
          decoration: const BoxDecoration(
            color: Color(0xFF003F44),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                text,
                style: textStyleMass1,
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: Text(
                  time,
                  style: textStyleMassTime,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// image sent
class SentImageModule extends StatelessWidget {
  final String text;
  final String time;
  final String imageLink;

  const SentImageModule({
    super.key,
    required this.text,
    required this.time,
    required this.imageLink,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 0,
            top: 5,
            bottom: 5,
          ),
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 5,
            left: 15,
            right: 5,
          ),
          width: (MediaQuery.of(context).size.width / 1.8),
          decoration: const BoxDecoration(
            color: Color(0xFF003F44),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(imageLink),
                  ),
                  // color: Color(0xFF04998F),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(6),
                  ),
                ),
              ),
              Text(
                text,
                style: textStyleMass1,
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: Text(
                  time,
                  style: textStyleMassTime,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// input Area

class InputArea extends StatelessWidget {
  const InputArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40, left: 20, right: 20),
      child: Row(
        children: [
          // input messege
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.black.withOpacity(0.4),
                    offset: const Offset(0, 5),
                  )
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search_rounded,
                      size: 26,
                      color: searchInputTextColor,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.mic_none_rounded,
                      size: 26,
                      color: searchInputTextColor,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.5,
                    horizontal: 35.5,
                  ),
                  filled: true,
                  fillColor: searchInputColor,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  hintText: 'Send Messege...',
                  hintStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: searchInputTextColor,
                  ),
                ),
              ),
            ),
          ),
          // send Button
          Container(
            margin: const EdgeInsets.only(left: 20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  color: Colors.black.withOpacity(0.4),
                  offset: const Offset(0, 5),
                )
              ],
            ),
            child: const Icon(
              Icons.send,
              color: Colors.white,
              size: 26,
            ),
          ),
        ],
      ),
    );
  }
}

// Header/AppBar
class HeaderAppBar extends StatelessWidget {
  final VoidCallback? goBack;
  const HeaderAppBar({
    super.key,
    this.goBack,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // margin: EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(
              10,
            ),
            bottomRight: Radius.circular(10),
          ),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xFF017D87),
              Color(0xFF003D41),
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // backbutton
            IconButton(
              onPressed: () {
                // Navigator.pop(context);
                goBack!();
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 24,
                color: Colors.white,
              ),
            ),
            // imageColumn
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  width: 66,
                  height: 49,
                  // color: Colors.red,
                  child: Image.asset('assets/images/AI icon 1.png'),
                ),
                const Text(
                  'Chat',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                )
              ],
            ),
            // three dots
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_horiz_rounded,
                color: Colors.white,
                size: 24,
              ),
            )
          ],
        ),
      ),
    );
  }
}
