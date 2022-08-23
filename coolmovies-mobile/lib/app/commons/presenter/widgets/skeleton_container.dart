import 'package:coolmovies/app/commons/utils/exports.dart';

class SkeletonContainer extends StatelessWidget {
  const SkeletonContainer({
    this.height,
    this.width,
    Key? key,
  }) : super(key: key);

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SkeletonAnimation(
      child: SkeletonAnimation(
        child: Container(
          height: height,
          width: width,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
    );
  }
}
