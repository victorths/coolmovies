import 'package:coolmovies/app/commons/utils/exports.dart';

class ReviewLoadingWidget extends StatelessWidget {
  const ReviewLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          for (int i = 0; i <= 1 + Random().nextInt(5); i++) ...[
            SkeletonContainer(
              width: MediaQuery.of(context).size.width,
              height: 120,
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ],
      ),
    );
  }
}
