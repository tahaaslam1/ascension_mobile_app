import 'package:equatable/equatable.dart';

abstract class Selectable extends Equatable {
  String get selectableIdentifier => 'Selectable';
  final int? _id;
  final String _label;
  String get label => _label;
  int? get id => _id;
  const Selectable._internal({int? id, required String label})
      : _id = id,
        _label = label;

  Selectable.fromMap(Map map)
      : _label = map['label'],
        _id = map.containsKey('id') ? map['id'] : null;

  @override
  List<Object?> get props => [_id, label, selectableIdentifier];
}

class Gender extends Selectable {
  @override
  String get selectableIdentifier => 'genders';
  const Gender({int? id, required String label}) : super._internal(id: id, label: label);
  Gender.fromMap(Map map) : super.fromMap(map);
}

class EmployementType extends Selectable {
  @override
  String get selectableIdentifier => 'employement_types';
  const EmployementType({int? id, required String label}) : super._internal(id: id, label: label);
  EmployementType.fromMap(Map map) : super.fromMap(map);
  factory EmployementType.fromJson(Map map) {
    return EmployementType(label: map['employement_type']);
  }
}

class WorkplaceType extends Selectable {
  @override
  String get selectableIdentifier => 'workplace_types';
  const WorkplaceType({int? id, required String label}) : super._internal(id: id, label: label);
  WorkplaceType.fromMap(Map map) : super.fromMap(map);
}

class City extends Selectable {
  @override
  String get selectableIdentifier => 'cities';
  const City({int? id, required String label}) : super._internal(id: id, label: label);
  City.fromMap(Map map) : super.fromMap(map);

  static const empty = City(label: '-', id: null);
}

class Country extends Selectable {
  @override
  String get selectableIdentifier => 'countries';
  const Country({int? id, required String label}) : super._internal(id: id, label: label);
  Country.fromMap(Map map) : super.fromMap(map);
}

class Industry extends Selectable {
  @override
  String get selectableIdentifier => 'industries';
  const Industry({int? id, required String label}) : super._internal(id: id, label: label);
  Industry.fromMap(Map map) : super.fromMap(map);
}

class Industry2 extends Selectable {
  @override
  String get selectableIdentifier => 'industries';
  const Industry2({int? id, required String label}) : super._internal(id: id, label: label);
  Industry2.fromMap(Map map) : super.fromMap(map);
}

class Skill extends Selectable {
  @override
  String get selectableIdentifier => 'skills';
  const Skill({int? id, required String label}) : super._internal(id: id, label: label);
  Skill.fromMap(Map map) : super.fromMap(map);
}

class Degree extends Selectable {
  @override
  String get selectableIdentifier => 'degrees';
  const Degree({int? id, required String label}) : super._internal(id: id, label: label);
  Degree.fromMap(Map map) : super.fromMap(map);
}

class Major extends Selectable {
  @override
  String get selectableIdentifier => 'majors';
  const Major({int? id, required String label}) : super._internal(id: id, label: label);
  Major.fromMap(Map map) : super.fromMap(map);
}

class Institute extends Selectable {
  @override
  String get selectableIdentifier => 'institutes';
  const Institute({int? id, required String label}) : super._internal(id: id, label: label);
  Institute.fromMap(Map map) : super.fromMap(map);
}

class JobTitle extends Selectable {
  @override
  String get selectableIdentifier => 'job_titles';
  const JobTitle({int? id, required String label}) : super._internal(id: id, label: label);
  JobTitle.fromMap(Map map) : super.fromMap(map);
}
