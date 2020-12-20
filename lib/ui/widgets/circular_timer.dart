import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:imvula/ui/res/colors.dart';

class CircularTimer extends StatefulWidget {
  final int timeInSeconds;
  final double strokeWidth;
  final bool isReverse;
  final Color color;
  final double size;

  CircularTimer(
      {this.isReverse,
      this.strokeWidth,
      this.timeInSeconds,
      this.size,
      this.color});

  @override
  _CircularTimerState createState() => _CircularTimerState();
}

class _CircularTimerState extends State<CircularTimer> {
  CountDownController _controller = CountDownController();
  bool _isPause = false;
  @override
  Widget build(BuildContext context) {
    return CircularCountDownTimer(
      // Countdown duration in Seconds
      duration: widget.timeInSeconds,
      controller: _controller,
      width: widget.size,
      height: widget.size,
      color: widget.color,
      fillColor: primaryColor,
      backgroundColor: null,
      strokeWidth: widget.strokeWidth,
      strokeCap: StrokeCap.round,
      textStyle: TextStyle(
          fontSize: 22.0, color: widget.color, fontWeight: FontWeight.bold),
      isReverse: widget.isReverse,
      isReverseAnimation: widget.isReverse,
      isTimerTextShown: true,
      onComplete: () {
        print('Countdown Ended');
      },
    );
  }
}
