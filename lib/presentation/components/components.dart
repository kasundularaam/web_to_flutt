import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class VSpacer extends StatelessWidget {
  final double height;
  const VSpacer({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
    );
  }
}

class HSpacer extends StatelessWidget {
  final double width;
  const HSpacer({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: width.w,
    );
  }
}

class Nothing extends StatelessWidget {
  const Nothing({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
