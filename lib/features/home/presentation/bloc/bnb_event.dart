part of 'bnb_bloc.dart';

@immutable
sealed class BnbEvent {}

class IsActiveColor extends BnbEvent {
  final int index;
  final bool isActive;

  IsActiveColor({
    required this.index,
    required this.isActive,
  });
}