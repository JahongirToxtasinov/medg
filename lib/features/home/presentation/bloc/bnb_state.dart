part of 'bnb_bloc.dart';

class BnbState {

  final int activeIndex;
  BnbState({required this.activeIndex});

  BnbState copyWith({
    int? activeIndex,
  }) {
    return BnbState(
      activeIndex: activeIndex ?? this.activeIndex,
    );
  }

  @override
  String toString() {
    return 'NbnState index $activeIndex';
  }

  @override
  bool operator ==(covariant BnbState other) {
    if (identical(this, other)) return true;

    return
      other.activeIndex == activeIndex;
  }

  @override
  int get hashCode {
    return activeIndex.hashCode;
  }
}