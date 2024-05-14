// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:plant_scan/constants/const.dart';
import 'package:plant_scan/screens/settings.dart';

class ToggleButtonWidget extends StatefulWidget {
  EdgeInsetsGeometry? margin;
  ToggleButtonWidget({
    super.key,
    this.margin,
  });

  @override
  State<ToggleButtonWidget> createState() => _ToggleButtonWidgetState();
}

class _ToggleButtonWidgetState extends State<ToggleButtonWidget>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  bool _isOn = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _isOn = !_isOn;
      if (_isOn) {
        _controller?.forward();
      } else {
        _controller?.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      child: AnimatedContainer(
        margin: widget.margin,
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(3),
        width: 38,
        height: 20,
        decoration: BoxDecoration(
          color: _isOn ? buttonColor : buttonColor.withOpacity(.3),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            AnimatedAlign(
              alignment: _isOn ? Alignment.centerRight : Alignment.centerLeft,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
