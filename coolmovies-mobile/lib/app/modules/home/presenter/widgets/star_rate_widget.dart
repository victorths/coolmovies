import 'package:coolmovies/app/commons/utils/exports.dart';

class StarRateWidget extends StatelessWidget {
  const StarRateWidget({
    Key? key,
    required this.rate,
  }) : super(key: key);

  final double rate;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            rate.toString(),
            style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white),
          ),
          Icon(
            Icons.star,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ],
      ),
    );
  }
}
