import 'commons/utils/exports.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    final HttpLink httpLink = HttpLink(
      Platform.isAndroid ? 'http://192.168.0.102:5001/graphql' : 'http://localhost:5001/graphql',
    );
    // These dependencies must be accessible to everyone in the app.
    Get.put<GraphQLClient>(
      GraphQLClient(
        link: httpLink,
        cache: GraphQLCache(
          store: HiveStore(),
        ),
      ),
      permanent: true,
    );
    Get.put(UserStore(), permanent: true);
  }
}
