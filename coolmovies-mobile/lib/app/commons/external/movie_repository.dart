import 'package:coolmovies/app/commons/utils/exports.dart';

class MovieRepository {
  MovieRepository({required this.client});

  final GraphQLClient client;

  Future<List<MovieEntity>> fetchAllMovies() async {
    try {
      final result = await client.query(
        QueryOptions(
          document: gql(r"""
          query Query {
            allMovies {
              nodes {
                id
                imgUrl
                movieDirectorId
                userCreatorId
                title
                releaseDate
                nodeId
                movieReviewsByMovieId{
                  nodes {
                    rating
                  }
                }
              }
            }
          }
        """),
        ),
      );
      final data = result.data?['allMovies'];
      if (result.hasException && data != null) {
        throw Exception(
          result.exception ?? "Query result Error",
        );
      } else {
        final castedData = data['nodes'].cast<Map<String, dynamic>>();
        return List<MovieEntity>.from(castedData.map((js) => MovieEntity.fromJson(js)));
      }
    } catch (e) {
      rethrow;
    }
  }
}
