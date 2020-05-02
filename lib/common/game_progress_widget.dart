import 'package:flutter/material.dart';
import '../styleguide/colors.dart';


class GameProgressWidget extends StatefulWidget {
  final double gameProgress;
  final double screenWidth;

  GameProgressWidget({this.gameProgress, this.screenWidth});

  @override
  _GameProgressWidgetState createState() => _GameProgressWidgetState();
}

class _GameProgressWidgetState extends State<GameProgressWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> progressAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    progressAnimation = Tween<double>(
      begin: 0,
      end: widget.screenWidth * 0.33 * widget.gameProgress
    ).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = widget.screenWidth * 0.33 ;

    return AnimatedBuilder(
      animation: progressAnimation,
      builder: (context, widget) {
        return Stack(
          children: <Widget>[
            Container(
              width: width,
              height: 10.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                border: Border.all(
                  color: tertiaryTextColor,
                  width: 1.0,
                ),
              ),
            ),
            Container(
              width: progressAnimation.value,
              height: 10.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                gradient: appGradient,
              ),
            ),
          ],
        );
      },
    );
  }
}
