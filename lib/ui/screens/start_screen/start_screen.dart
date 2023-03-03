import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_book/ui/screens/start_screen/widgets/book_image/book_image.dart';
import 'package:my_book/ui/screens/start_screen/widgets/button_part/button_part.dart';
import 'package:my_book/ui/screens/start_screen/widgets/info_part/info_part.dart';
import 'package:my_book/helper_entities/colors.dart';
import 'package:sensors_plus/sensors_plus.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  AccelerometerEvent? acceleration;
  StreamSubscription<AccelerometerEvent>? _streamSubscription;

  @override
  void initState() {
    super.initState();

    _streamSubscription =
        accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        acceleration = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double accelerationX = 0;
    double accelerationY = 0;
    if ((acceleration?.x ?? 0) > 30) {
      accelerationX = 30;
    } else if ((acceleration?.x ?? 0) < -30) {
      accelerationX = -30;
    } else {
      accelerationX = acceleration?.x ?? 0;
    }

    if ((acceleration?.y ?? 0) > 30) {
      accelerationY = 30;
    } else if ((acceleration?.y ?? 0) < -30) {
      accelerationY = -30;
    } else {
      accelerationY = acceleration?.y ?? 0;
    }
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: AppElementColors.backgroundGrey,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: SizedBox(
                // width: MediaQuery.of(context).size.width / 1.3,
                // padding: const EdgeInsets.symmetric(horizontal: 68),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                      flex: 4,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 300),
                            top: MediaQuery.of(context).size.height / 5.5 +
                                accelerationY * 3,
                            left: MediaQuery.of(context).size.width / 2 -
                                9.8 +
                                accelerationX * 5,
                            child: FractionalTranslation(
                              translation: Offset(-0.5, -0.5),
                              child: BookImage(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: InfoPart(),
                    ),
                    Flexible(
                      flex: 3,
                      child: ButtonPart(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _streamSubscription!.cancel();
    super.dispose();
  }
}
