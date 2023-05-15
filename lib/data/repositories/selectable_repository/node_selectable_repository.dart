import 'package:ascension_mobile_app/data/repositories/selectable_repository/selectable_repository.dart';
import 'package:ascension_mobile_app/logger.dart';
import 'package:ascension_mobile_app/models/selectable.dart';
import 'package:ascension_mobile_app/networking/client/http_client.dart';
import 'package:dio/dio.dart';

Map<String, Function> types = {
  //'Gender': (map) => Gender.fromMap(map),
  //'WorkplaceType': (map) => WorkplaceType.fromMap(map),
  //'EmployementType': (map) => EmployementType.fromMap(map),
  //'Major': (map) => Major.fromMap(map),
  //'Degree': (map) => Degree.fromMap(map),
  'City': (map) => City.fromMap(map),
  'Country': (map) => Country.fromMap(map),
  'Industry': (map) => Industry.fromMap(map),
  'Industry2': (map) => Industry2.fromMap(map)
  //'Skill': (map) => Skill.fromMap(map),
};

class NodeSelectableRepository extends SelectableRepository {
  final HTTPClient httpClient;

  NodeSelectableRepository({required this.httpClient});

  List<Selectable>? selectables;

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

  @override
  Future<List<Selectable?>> getSelectables(Type selectableType) async {
    logger.wtf(selectableType.toString());
    Selectable instance = types[selectableType.toString()]!({'label': 'unknown', 'id': 0});

    final String endpoint = '/getSelectables/${instance.selectableIdentifier}';

    final Response response = await httpClient.get(endpoint);

    logger.wtf('Fetched Selectable data Successfully: $response');

    selectables = [];

    response.data['data'].forEach((element) {
      selectables!.add(types[selectableType.toString()]!({'label': element['label'], 'id': element['id']}));
    });

    return selectables!;
  }

  @override
  Future<void> addNewSelectable(Selectable newSelectable) {
    // TODO: implement addNewSelectable
    throw UnimplementedError();
  }

  @override
  List<Selectable?> filterSelectables(String searchTerm) {
    // TODO: implement filterSelectables
    throw UnimplementedError();
  }

//   @override
//   List<Selectable?> filterSelectables(String searchTerm) {
//     logger.i(searchTerm);
//     List<Selectable?> result = selectables!.where((f) => f.label.toLowerCase().startsWith(searchTerm)).toList();
//     logger.i(result);
//     return result;
//   }
}
