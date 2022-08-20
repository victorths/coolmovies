import 'commons/utils/exports.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    final HttpLink httpLink = HttpLink(
      Platform.isAndroid ? 'http://10.0.2.2:5001/graphql' : 'http://localhost:5001/graphql',
    );

    final AuthLink authLink = AuthLink(
      getToken: () async => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
    );

    final Link link = authLink.concat(httpLink);

    // These dependencies must be accessible to everyone in the app.
    Get.put<GraphQLClient>(
      GraphQLClient(
        link: link,
        cache: GraphQLCache(store: HiveStore()),
      ),
      permanent: true,
    );
    Get.put(UserStore(), permanent: true);
  }
}
