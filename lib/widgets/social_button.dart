import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:state_manager/pages/pallette.dart';

class SocialButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final double horizontalPadding;
  const SocialButton(
      {super.key,
      required this.iconPath,
      required this.label,
      this.horizontalPadding = 75});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () {},
        icon: SvgPicture.asset(iconPath, width: 30, color: Pallete.whiteColor),
        label: Text(label,
            style: const TextStyle(color: Pallete.whiteColor, fontSize: 17)),
        style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(
                vertical: 15, horizontal: horizontalPadding),
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: Pallete.borderColor, width: 1),
                borderRadius: BorderRadius.circular(10))));
  }
}
