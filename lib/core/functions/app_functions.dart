import 'package:flutter/cupertino.dart';
import 'package:medg/features/main/domain/entity/news_entity.dart';

import '../../features/main/data/model/news_model.dart';

CupertinoPageRoute fade(Widget widget) {
  return CupertinoPageRoute(
    builder: (context) {
      return widget;
    },
  );
}



extension NewsModelToEntities on NewsModel {
  NewsEntity get toEntities {
    return NewsEntity(
      isSaved: isSaved,
      title: title,
      description: description,
      createdAt: createdAt.toDate(),
      picture: picture,
      doctorName: doctorName,
      category: category,
    );
  }
}
