import 'package:flutter/material.dart';

class InstapetButtom extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final double? width;
  final double? height;
  final Color? color;
  final Color? fontColor;

  const InstapetButtom({
    Key? key,
    required this.label,
    required this.onPressed,
    this.width,
    this.height = 50,
    this.color,
    this.fontColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: fontColor,
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          primary: color,
        ),
      ),
    );
  }
}


// TEstar

// SizedBox(
//                     width: responsive.dp(22),
//                     height: responsive.dp(5),
//                     child: ElevatedButton(
//                       onPressed: () {},
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Image.asset('assets/icons/facebook_icon.png', width: responsive.dp(3.8), height: responsive.dp(3.8),),
//                           Text(
//                             'Login Facebook',
//                             style: TextStyle(
//                               fontSize: responsive.dp(1.8),
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black
//                             ),
//                           ),
//                         ],
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         elevation: 10,
//                         shape: StadiumBorder(),
//                         primary: Colors.white, // Color(0xFF1777F2),
//                       ),
//                     ),
//                   )