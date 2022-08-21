import 'package:coolmovies/app/commons/utils/exports.dart';

class UserRepository {
  UserRepository({required this.client});

  final GraphQLClient client;

  Future<List<UserEntity>> fetchAllUsers() async {
    try {
      final result = await client.query(
        QueryOptions(
          document: gql(r"""
          query {
            allUsers {
              nodes {
                id
                name
              }
            }
          }
        """),
        ),
      );
      final data = result.data?['allUsers'];
      if (result.hasException && data != null) {
        throw Exception(
          result.exception ?? "Query result Error",
        );
      } else {
        final castedData = data['nodes'].cast<Map<String, dynamic>>();
        return List<UserEntity>.from(castedData.map((js) => UserEntity.fromJson(js)));
      }
    } catch (e) {
      rethrow;
    }
  }
}
