import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medg/assets/colors.dart';
import '../bloc/bnb_bloc.dart';

class BnbItem extends StatelessWidget {
  final int index;
  final String icon;
  final String title;
  final Function() onTap;

  const BnbItem({
    Key? key,
    required this.index,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: BlocBuilder<BnbBloc, BnbState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              SvgPicture.asset(
                icon,width: 24,height: 24,
                color: index == state.activeIndex ? darkBlueText : null,
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(color:
                index == state.activeIndex
                    ? darkBlueText
                    : greyText,
                ),
              ),
              const SizedBox(height: 10.5),
            ],
          );
        },
      ),
    );
  }
}