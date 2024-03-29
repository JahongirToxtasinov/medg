import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medg/core/widgets/loading_widget.dart';
import 'package:medg/features/main/data/model/news_status.dart';
import 'package:medg/features/main/presentation/bloc/news_bloc.dart';
import 'package:medg/features/news/presentation/widgets/new_item.dart';
import '../../../../assets/icons.dart';
import '../../../../core/widgets/my_text_field.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset(AppIcons.mainLogo, width: 142,),
            const Spacer(),
            SvgPicture.asset(AppIcons.notification)
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size(double.maxFinite, 66),
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: MyTextField(
              hintText: "Ilmiy maqolalarni izlash",
              controller: controller,
            ),
          ),
        ),
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if(state.newsStatus == NewsStatus.pure) {
            context.read<NewsBloc>().add(NewsStarted());
            return const SizedBox();
          } else if(state.newsStatus == NewsStatus.loading) {
            return const LoadingWidget();
          } else if (state.newsStatus == NewsStatus.failure) {
            return Center(child: Text("Error occured"),);
          } else {
            return
              ListView(
                children: [
                  ...List.generate(
                      state.newsList.length, (index) =>
                      NewItem(
                          newsEntity: state.newsList[index], onTap: () {}))
                ],
              );
          }
        },
      ),
    );
  }
}
