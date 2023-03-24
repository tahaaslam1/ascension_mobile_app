import 'package:ascension_mobile_app/models/education.dart';
import 'package:ascension_mobile_app/models/preference.dart';
import 'package:ascension_mobile_app/models/selectable.dart';
import 'package:ascension_mobile_app/models/user.dart';

class Buyer extends User {
  final List<Education>? education;
  final Preferrence? preferrence;
  final List<Skill>? skills;

  const Buyer({
    required super.userId,
    required super.email,
    required super.firstName,
    required super.lastName,
    required super.userType,
    this.education,
    this.preferrence,
    this.skills,
  });

  @override
  List<Object?> get props => super.props + [education, preferrence, skills];
}
