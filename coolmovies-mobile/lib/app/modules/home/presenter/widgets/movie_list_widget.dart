import 'package:coolmovies/app/commons/utils/exports.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({
    Key? key,
    required this.movies,
    required this.onTap,
  }) : super(key: key);

  final List<MovieEntity> movies;
  final void Function(MovieEntity) onTap;

  @override
  Widget build(BuildContext context) {
    return CarouselWidget(
      items: movies
          .map(
            (movie) => CarouselCard(
              onTap: () => onTap(movie),
              topLeftChild: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Text(
                  movie.title,
                  style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.white),
                ),
              ),
              bottomRightChild: StarRateWidget(
                rate: movie.rate,
              ),
              child: Container(
                color: Theme.of(context).colorScheme.tertiary,
                child: Image.network(
                  movie.imgUrl,
                  fit: BoxFit.fitHeight,
                  loadingBuilder: (context, child, loadingProgress) => loadingProgress == null
                      ? child
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
