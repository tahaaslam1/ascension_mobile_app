Map<String, Function> types = {
  //'Gender': (map) => Gender.fromMap(map),
  //'WorkplaceType': (map) => WorkplaceType.fromMap(map),
  //'EmployementType': (map) => EmployementType.fromMap(map),
  //'Major': (map) => Major.fromMap(map),
  //'Degree': (map) => Degree.fromMap(map),
  //'City': (map) => City.fromMap(map),
  //'Country': (map) => Country.fromMap(map),
  //'Industry': (map) => Industry.fromMap(map),
  //'Skill': (map) => Skill.fromMap(map),
};

// class SupabaseSelectableRepository extends SelectableRepository {
//   List<Selectable>? selectables;

//   @override
//   Future<void> addNewSelectable(Selectable newSelectable) async {
//     Selectable instance = types[newSelectable.runtimeType.toString()]!({'label': 'unknown', 'id': 0});
//     final response = await kSupabase.from(instance.selectableIdentifier).insert({'label': newSelectable.label}).execute();
//     if (response.error != null) {
//       logger.i(response.error);
//       throw Exception;
//     } else {
//       logger.i("Selectable Added to Database Sucessfully!");
//     }
//   }

//   @override
//   Future<List<Selectable?>> getSelectables(Type selectableType) async {
//     Selectable instance = types[selectableType.toString()]!({'label': 'unknown', 'id': 0});

//     final response = await kSupabase.from(instance.selectableIdentifier).select('*').execute();
//     if (response.hasError) {
//       throw Exception();
//     } else {
//       logger.i("Fetched Selectable Data Successfully!");
//       selectables = [];
//       response.data.forEach((element) {
//         selectables!.add(types[selectableType.toString()]!({'label': element['label'], 'id': element['id']}));
//       });
//     }
//     return selectables!;
//   }

//   @override
//   List<Selectable?> filterSelectables(String searchTerm) {
//     logger.i(searchTerm);
//     List<Selectable?> result = selectables!.where((f) => f.label.toLowerCase().startsWith(searchTerm)).toList();
//     logger.i(result);
//     return result;
//   }
// }
