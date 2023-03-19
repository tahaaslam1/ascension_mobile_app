import 'package:ascension_mobile_app/models/qualification.dart';
import 'package:ascension_mobile_app/models/selectable.dart';
import 'package:equatable/equatable.dart';

class Education extends Equatable {
  final Institute institute;
  final Qualification qualification;
  final City? location;
  final String? grade;

  const Education({required this.institute, required this.qualification, this.location, this.grade});

  @override
  List<Object?> get props => [institute, qualification, location, grade];
}
