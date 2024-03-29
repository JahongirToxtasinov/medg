import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:medg/assets/colors.dart';
import '../../../../assets/icons.dart';
import '../../../main/domain/entity/news_entity.dart';

class NewItem extends StatelessWidget {
  final NewsEntity newsEntity;
  final VoidCallback onTap;
  const NewItem({required this.newsEntity,required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12,),
      child: Container(
        padding: const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 13),
        decoration: BoxDecoration(
            color: white,
            border: Border.all(color: lightBlueText, width: 1),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      maxLines: 2,
                      newsEntity.title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: darkBlueText),
                    ),
                    const Gap(8),
                    Text(
                      newsEntity.doctorName,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const Gap(6),
                    Text(
                      newsEntity.category,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: greyText),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Image.network(newsEntity.picture))
              ],
            ),
            const Gap(6),
            const Divider(
              height: 1,
              color: textFieldBgColor,
            ),
            const Gap(8),
            Text(
              maxLines: 3,
              newsEntity.description,
              style: Theme.of(context).textTheme.labelMedium!,
            ),
            const Gap(8),
            Row(
              children: [
                Text(
                  _timeFormat(newsEntity.createdAt),
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: greyText),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: onTap,
                    child: SvgPicture.asset(newsEntity.isSaved ? AppIcons.saved : AppIcons.unSaved))
              ],
            )
          ],
        ),
      ),
    );
  }
}

String _timeFormat(DateTime time) {
  String day = time.day.toString().padLeft(2, '0');
  String month = time.month.toString().padLeft(2, '0');
  String year = time.year.toString();
  return '$day.$month.${year}y';
}