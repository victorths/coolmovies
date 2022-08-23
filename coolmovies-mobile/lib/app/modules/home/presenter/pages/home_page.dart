import 'package:coolmovies/app/commons/utils/exports.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 50, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Movies',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Container(
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Obx(
                () {
                  switch (controller.store.state) {
                    case StoreState.loading:
                      return const MovieLoadingWidget();
                    case StoreState.await:
                      return MovieListWidget(
                        movies: controller.store.movies.toList(),
                        onTap: (movie) => controller.navigateToMovie(movie),
                      );
                    case StoreState.error:
                      return const MovieErrorWidget();
                    case StoreState.noContent:
                      return const MovieNotFoundWidget();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
