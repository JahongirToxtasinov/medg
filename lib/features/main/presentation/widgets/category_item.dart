import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:medg/assets/colors.dart';

class CategoryItem extends StatelessWidget {
  final String icon;
  final String title;
  final Function() onTap;
  const CategoryItem({super.key,
  required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      // width: 160,height: 150,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            blurStyle: BlurStyle.outer,
            color:greyText.withOpacity(0.5),
          ),
        ],
        
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(16),
            SvgPicture.asset(icon,width: 42,height: 42,),
            const Gap(17),
            Text(
              title,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 16),
            ),
            const Gap(16),
            SizedBox(height: 28,
              child: OutlinedButton(
                onPressed: onTap,
                style: ButtonStyle(
                  side: MaterialStateProperty.all(const BorderSide(
                    color: lightBlueText, // Border color
                    width: 1, // Border width
                  )),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                child: const Text(
                  'Turkumga kirish',
                  style: TextStyle(color: lightBlueText),
                ),
              ),
            ),
            const Gap(8)
          ],
      ),
    );
  }
}
