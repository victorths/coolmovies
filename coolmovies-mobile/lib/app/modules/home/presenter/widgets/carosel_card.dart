import 'package:coolmovies/app/commons/utils/exports.dart';

class CarouselCard extends StatelessWidget {
  const CarouselCard({
    Key? key,
    required this.child,
    required this.topLeftChild,
    this.onTap,
    this.bottomRightChild,
  }) : super(key: key);

  final Widget child;
  final Widget topLeftChild;
  final Widget? bottomRightChild;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.tertiary.withOpacity(0.15),
                    blurRadius: 15,
                    spreadRadius: 2,
                    offset: const Offset(-10, 10),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: child,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              height: 70,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Center(
                child: topLeftChild,
              ),
            ),
          ),
          if (bottomRightChild != null)
            Align(
              alignment: const Alignment(0, .8),
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                child: bottomRightChild,
              ),
            ),
        ],
      ),
    );
  }
}
