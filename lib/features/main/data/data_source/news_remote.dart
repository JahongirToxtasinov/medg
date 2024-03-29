import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medg/core/functions/app_functions.dart';
import 'package:medg/features/main/domain/entity/news_entity.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/injector/injector.dart';
import '../model/news_model.dart';

abstract class NewsDataSource {
  Future<List<NewsEntity>> getNews();

  factory NewsDataSource()=> _NewsDataSource();
}

class _NewsDataSource implements NewsDataSource {
  @override
  Future<List<NewsEntity>> getNews() async {
    final firebase =  sl<FirebaseFirestore>();
    final result = await firebase.collection('news').get();
    final response = result.docs;
    final data = response
        .map(
          (e) => NewsModel.fromJson(
        e.data(),
        e.id,
      ),
    )
        .toList();
    if (data.isNotEmpty) {
      return data.map((e) => e.toEntities).toList();
    } else {
      throw ServerException(
        errorMessage: "errorMessage",
        errorCode: "errorCode",
      );
    }
  }
}
