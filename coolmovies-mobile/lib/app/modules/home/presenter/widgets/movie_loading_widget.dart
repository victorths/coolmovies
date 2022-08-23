import 'package:coolmovies/app/commons/utils/exports.dart';

class MovieLoadingWidget extends StatelessWidget {
  const MovieLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselWidget(
      items: [
        for (int i = 0; i <= 1 + Random().nextInt(4); i++)
          const CarouselCard(
            topLeftChild: SkeletonContainer(),
            child: SkeletonContainer(),
          )
      ],
    );
  }
}
