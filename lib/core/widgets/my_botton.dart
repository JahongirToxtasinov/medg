import 'package:flutter/material.dart';
import 'package:medg/assets/colors.dart';

class MyButton extends StatelessWidget {
  final Function() onTap;
  final String title;
  final Color buttonColor;
  const MyButton({
    required this.onTap,
    required this.title,
    this.buttonColor = bottomColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 42,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: buttonColor,
            border: buttonColor == white ? Border.all(color: greyText) : null
          ),
          child: Center(
            child: Text(title,style: buttonColor == white ?
            Theme.of(context).textTheme
                .headlineSmall!.copyWith(
                color: darkBlueText) :
            Theme.of(context).textTheme
                .displaySmall!
            ),
          ),
      ),
    );
  }
}