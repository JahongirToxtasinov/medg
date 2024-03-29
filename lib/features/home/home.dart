import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medg/assets/colors.dart';
import 'package:medg/features/calendar/presentation/calendar_screen.dart';
import 'package:medg/features/chat/presentation/pages/chat_control.dart';
import 'package:medg/features/home/presentation/bloc/bnb_bloc.dart';
import 'package:medg/features/home/presentation/widgets/bnb_item.dart';
import 'package:medg/features/main/presentation/main_screen.dart';
import 'package:medg/features/news/presentation/pages/news_screen.dart';
import 'package:medg/features/profile/presentation/profile_screen.dart';

import '../../assets/icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController homePageController;

  var index = 0;

  @override
  void initState() {
    homePageController = PageController(initialPage: index);
    super.initState();
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BnbBloc(),
      child: BlocBuilder<BnbBloc, BnbState>(
        builder: (context, state) {
          return Scaffold(
            body: Column(children: [
              Expanded(
                child: PageView(
                  controller: homePageController,
                  children: const [
                    MainScreen(),
                    NewsScreen(),
                    ChatScreen(),
                    CalendarScreen(),
                    ProfileScreen(),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom),
                decoration: const BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BnbItem(
                            index: 0,
                            icon: AppIcons.main,
                            title: "asosiy",
                            onTap: () {
                              index = 0;
                              homePageController.jumpToPage(index);
                              context
                                  .read<BnbBloc>()
                                  .add(IsActiveColor(index: 0, isActive: true));
                            }),
                        BnbItem(
                            index: 1,
                            icon: AppIcons.news,
                            title: "Maqolalar",
                            onTap: () {
                              index = 1;
                              homePageController.jumpToPage(index);
                              context
                                  .read<BnbBloc>()
                                  .add(IsActiveColor(index: 1, isActive: true));
                            }),
                        BnbItem(
                            index: 2,
                            icon: AppIcons.chat,
                            title: "Chat",
                            onTap: () {
                              index = 2;
                              homePageController.jumpToPage(index);
                              context
                                  .read<BnbBloc>()
                                  .add(IsActiveColor(index: 2, isActive: true));
                            }),
                        BnbItem(
                            index: 3,
                            icon: AppIcons.calendar,
                            title: "Kalendar",
                            onTap: () {
                              index = 3;
                              homePageController.jumpToPage(index);
                              context
                                  .read<BnbBloc>()
                                  .add(IsActiveColor(index: 3, isActive: true));
                            }),
                        BnbItem(
                          index: 4,
                          icon: AppIcons.profile,
                          title: "Profil",
                          onTap: () {
                            index = 4;
                            homePageController.jumpToPage(index);
                            context
                                .read<BnbBloc>()
                                .add(IsActiveColor(index: 4, isActive: true));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    homePageController.dispose();
    super.dispose();
  }
}