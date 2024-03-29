import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:medg/assets/colors.dart';
import 'package:medg/assets/icons.dart';
import 'package:medg/core/widgets/my_botton.dart';
import 'package:medg/features/main/presentation/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../assets/images.dart';
import '../app_route_name/app_route_names.dart';
import '../injector/injector.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final controller = PageController();
  int thisPage = 0;

  @override
  void initState() {
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  DecorationImage _buildDecorationImage() {
    if (thisPage == 0) {
      return const DecorationImage(
        image: AssetImage(AppImages.onb1),
        fit: BoxFit.cover,
      );
    } else if (thisPage == 1) {
      return const DecorationImage(
        image: AssetImage(AppImages.onb2),
        fit: BoxFit.cover,
      );
    } else {
      return const DecorationImage(
        image: AssetImage(AppImages.onb3),
        fit: BoxFit.cover,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            image: _buildDecorationImage(),
          ),
          child: PageView(
            onPageChanged: (value) {
              thisPage = value;
            },
            controller: controller,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          sl<SharedPreferences>().setBool("wizard", true);
                          Navigator.of(context).pushNamed(AppRouteNames.login);
                        },
                        child: Text(
                          "Skip",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                      const Gap(8),
                      SvgPicture.asset(AppIcons.skipLine),
                    ],
                  ),
                  Gap(MediaQuery.sizeOf(context).height * 0.6),
                  Text("Mutaxasislardan maslahat",
                      style: Theme.of(context).textTheme.displayLarge),
                  const Gap(19),
                  Text(
                      textAlign: TextAlign.center,
                      "Find a doctor who will take the best \ncare of your health...",
                      style: Theme.of(context).textTheme.displayMedium),
                  Gap(MediaQuery.of(context).padding.bottom + 150),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Gap(MediaQuery.sizeOf(context).height * 0.6),
                  Text(
                      textAlign: TextAlign.center,
                      "Rejalashtirilgan \ndavolanish tartibi",
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(color: onBoardText)),
                  const Gap(10),
                  Text(
                      textAlign: TextAlign.center,
                      "Set up a reminder to take the \nmedicine on time...",
                      style: Theme.of(context).textTheme.displayMedium),
                  Gap(MediaQuery.of(context).padding.bottom + 150),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Gap(MediaQuery.sizeOf(context).height * 0.6),
                  Text("Order Medicine Online",
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(color: onBoardRedText)),
                  const Gap(19),
                  Text(
                      textAlign: TextAlign.center,
                      "Order your medicine that your \ndoctor provided you...",
                      style: Theme.of(context).textTheme.displayMedium),
                  Gap(MediaQuery.of(context).padding.bottom + 150),
                ],
              ),
            ],
          ),
        ),
        //___________________________________________________________________________________________________//
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).padding.bottom + 16,
          ),
          child: MyButton(
            onTap: () async {
              if (thisPage == 0 || thisPage == 1) {
                print("next page");
                controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease);
              } else {
                sl<SharedPreferences>().setBool("wizard", true);
                Navigator.of(context).pushNamed(AppRouteNames.login);
              }
            },
            title: thisPage == 2 ? "Asosiyga o’tish" : "Davom etish",
            buttonColor: bottomColor,
          ),
        ),
      ),
    );
  }
}
