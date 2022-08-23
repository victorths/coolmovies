import 'package:coolmovies/app/commons/utils/exports.dart';

class StarsRateForm extends StatelessWidget {
  const StarsRateForm({
    Key? key,
    required this.rate,
    required this.onTap,
  }) : super(key: key);

  final int rate;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [for (int i = 1; i <= 5; i++) _buildIcon(i, context)],
    );
  }

  Widget _buildIcon(int i, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => onTap(i),
        child: Icon(
          rate >= i
              ? Icons.star
              : rate > i - 1
                  ? Icons.star_half
                  : Icons.star_border,
          size: 36,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
