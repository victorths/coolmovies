import 'package:coolmovies/app/commons/utils/exports.dart';

class StarsRateWidget extends StatelessWidget {
  const StarsRateWidget({
    Key? key,
    required this.rate,
  }) : super(key: key);

  final double rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [for (int i = 1; i <= 5; i++) _buildIcon(i, rate, context)],
    );
  }

  Widget _buildIcon(int i, double rate, BuildContext context) {
    return Icon(
      rate >= i
          ? Icons.star
          : rate > i - 1
              ? Icons.star_half
              : Icons.star_border,
      color: Theme.of(context).colorScheme.secondary,
    );
  }
}
