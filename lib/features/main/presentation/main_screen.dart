import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:medg/assets/colors.dart';
import 'package:medg/features/main/presentation/bloc/news_bloc.dart';
import 'package:medg/features/main/presentation/widgets/category_item.dart';
import 'package:medg/features/news/presentation/widgets/new_item.dart';
import '../../../assets/icons.dart';
import '../../../core/widgets/my_text_field.dart';
import '../../chat/presentation/pages/chat_control.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Builder(
      builder: (context) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.mainLogo,
                    width: 142,
                  ),
                  const Spacer(),
                  SvgPicture.asset(AppIcons.notification)
                ],
              ),
              bottom: PreferredSize(
                preferredSize: const Size(double.maxFinite, 66),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: MyTextField(
                    onChanged: (value) {
                      context.read<NewsBloc>().add(Searching(query: value));
                    },
                    hintText: "Ilmiy maqolalarni izlash",
                    controller: controller,
                  ),
                ),
              ),
            ),
            body: BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
                  child: ListView(children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Turkumlar",
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(
                            fontWeight: FontWeight.w600, color: darkBlueText),
                      ),
                    ),
                    SizedBox(
                      height: 155,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(width: 8);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return CategoryItem(
                            icon: icon[index],
                            title: name[index],
                            onTap: () {},
                          );
                        },
                      ),
                    ),
                    const Gap(38),
                    Row(
                      children: [
                        Text(
                          "So’nggi maqolalar",
                          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                              fontWeight: FontWeight.w600, color: darkBlueText),
                        ),
                        const Spacer(),
                        Text(
                          "Barcha maqolalar",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(color: lightBlueText),
                        ),
                      ],
                    ),
                    ...List.generate(
                        state.newsList.length,
                        (index) => GestureDetector(
                              onTap: () {
                                // Navigator.push((context) => Maqola(
                                //   entities
                                // ))
                              },
                              child: NewItem(
                                onTap: () {},
                                newsEntity: state.newsList[index],
                              ),
                            ))
                  ]),
                );
              },
            ),
          ),
        );
      }
    );
  }
}
