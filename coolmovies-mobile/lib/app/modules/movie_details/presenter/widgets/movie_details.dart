import 'package:coolmovies/app/commons/utils/exports.dart';

class MovieDetailsWidget extends StatelessWidget {
  const MovieDetailsWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Text(
              movie.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              height: 3,
              width: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  movie.rate.toString(),
                  style: Theme.of(context).textTheme.headline2!.copyWith(color: Theme.of(context).colorScheme.secondary),
                ),
                const Text('Score'),
              ],
            ),
            const SizedBox(
              width: 16,
            ),
            Container(
              height: 40,
              width: 2,
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary),
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              children: [
                Text(
                  movie.releaseDate.formatDate,
                  style: Theme.of(context).textTheme.headline2!.copyWith(color: Theme.of(context).colorScheme.secondary),
                ),
                const Text('Premiere'),
              ],
            ),
          ],
        )
      ],
    );
  }
}
