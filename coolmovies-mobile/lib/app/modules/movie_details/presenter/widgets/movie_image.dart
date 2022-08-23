import 'package:coolmovies/app/commons/utils/exports.dart';

class MovieImageWidget extends StatelessWidget {
  const MovieImageWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: Key(movie.id),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.30),
              blurRadius: 20,
              spreadRadius: 2,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          child: Image.network(
            movie.imgUrl,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
