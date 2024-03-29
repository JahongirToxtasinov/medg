import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medg/assets/icons.dart';

import '../../assets/colors.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Function(String value)? onChanged;
  const MyTextField({
    this.onChanged,
    required this.controller,
    required this.hintText,
    super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 40,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: TextField(
          onChanged: onChanged,
            controller: controller,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 10,top: 8,bottom: 8,right: 4),
                child: SvgPicture.asset(AppIcons.search),
              ),
              border: InputBorder.none,
              filled: true,
              fillColor: textFieldBgColor,
              hintText: hintText,
              contentPadding: const EdgeInsets.only(bottom: 4),
              hintStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(color: greyText),
            ),
          ),
      ),
    );
  }
}

