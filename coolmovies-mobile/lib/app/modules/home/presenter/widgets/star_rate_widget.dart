import 'package:coolmovies/app/commons/utils/exports.dart';

class StarRateWidget extends StatelessWidget {
  const StarRateWidget({
    Key? key,
    required this.rate,
  }) : super(key: key);

  final double rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [for (int i = 1; i <= 5; i++) _buildIcon(i, rate)],
    );
  }

  Widget _buildIcon(int i, double rate) {
    return Icon(
      rate >= i
          ? Icons.star
          : rate > i - 1
              ? Icons.star_half
              : Icons.star_border,
      color: Colors.yellow,
    );
  }
}
