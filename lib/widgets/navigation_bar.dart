import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustonNavigationBar extends StatefulWidget {
  const CustonNavigationBar({super.key});

  @override
  State<CustonNavigationBar> createState() => _CustonNavigationBarState();
}

class _CustonNavigationBarState extends State<CustonNavigationBar> {
  @override
  Widget build(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight/12,
      
    );
  }
}