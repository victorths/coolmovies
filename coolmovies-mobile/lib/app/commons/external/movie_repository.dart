import 'package:coolmovies/app/commons/utils/exports.dart';

class MovieRepository {
  MovieRepository({required this.client});

  final GraphQLClient client;

  Future<List<MovieEntity>> fetchAllMovies() async {
    try {
      final result = await client.query(
        QueryOptions(
          document: gql("""
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

  Future<List<ReviewEntity>> fetchReviewsByMovieId(String movieId) async {
    try {
      client.resetStore();
      final result = await client.query(
        QueryOptions(
          document: gql(
            """
            {
              allMovieReviews(
                filter: {movieId: {equalTo: "$movieId"}}
              ) {
                nodes {
                  id
                  title
                  body
                  rating
                  movieId
                  nodeId
                  userByUserReviewerId {
                    name
                    id
                  }
                }
              }
            }
        """,
          ),
        ),
      );
      final data = result.data?['allMovieReviews'];
      if (result.hasException && data != null) {
        throw Exception(
          result.exception ?? "Query result Error",
        );
      } else {
        final castedData = data['nodes'].cast<Map<String, dynamic>>();
        return List<ReviewEntity>.from(castedData.map((js) => ReviewEntity.fromJson(js)));
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> submitForm(dynamic data, String? nodeId) async {
    try {
      final result = await client.mutate(
        MutationOptions(
          document: gql("""
            mutation {
              ${nodeId == null ? 'createMovieReview' : 'updateMovieReview'} (
                input: {
                  ${nodeId == null ? '' : 'nodeId: "$nodeId"'}
                  ${nodeId == null ? 'movieReview' : 'movieReviewPatch'}: $data   
                }             
              )
              {
                movieReview {
                  id
                  title
                  body
                  rating
                  movieByMovieId {
                    title
                  }
                  userByUserReviewerId {
                    name
                  }
                }
              }
            }
          """),
        ),
      );
      if (result.data != null && result.data?[nodeId == null ? 'createMovieReview' : 'updateMovieReview'] != null) {
        return true;
      } else {
        false;
      }
    } catch (e) {
      rethrow;
    }
    return false;
  }
}
