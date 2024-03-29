
import 'package:equatable/equatable.dart';

class NewEntity extends Equatable {
  final String title;
  final String image;
  final String doctorName;
  final String category;
  final String description;
  final bool isSaved;
  final DateTime createdAt;
  const NewEntity({
    required this.title,
    required this.doctorName,
    required this.image,
    required this.category,
    required this.description,
    required this.isSaved,
    required this.createdAt,
  });
  @override
  List<Object?> get props => [
    title,
    image,
    description,
    doctorName,
    category,
    description,
    isSaved,
    createdAt,
  ];
}
