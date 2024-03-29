part of 'news_bloc.dart';

class NewsEvent {}

class NewsStarted extends NewsEvent{}

class Searching extends NewsEvent {
  final String query;

  Searching({
    required this.query,
  });
}